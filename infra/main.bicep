
param environment string
param baseName string
param location string
param containerImage string
param logAnalyticsSku string = 'PerGB2018'

var resourceGroupName = 'rg-${baseName}-${toLower(environment)}'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: resourceGroupName
  location: location
}

module logAnalytics './modules/logAnalytics.bicep' = {
  name: '${baseName}-law'
  scope: rg
  params: {
    baseName: baseName
    location: location
    sku: logAnalyticsSku
  }
}

module acr './modules/containerRegistry.bicep' = {
  name: '${baseName}-acr'
  scope: rg
  params: {
    baseName: baseName
    location: location
  }
}

module kv './modules/keyVault.bicep' = {
  name: '${baseName}-kv'
  scope: rg
  params: {
    baseName: baseName
    location: location
  }
}

module eventGrid './modules/eventGrid.bicep' = {
  name: '${baseName}-eventgrid'
  scope: rg
  params: {
    baseName: baseName
    location: location
  }
}

module env './modules/containerEnv.bicep' = {
  name: '${baseName}-env'
  scope: rg
  params: {
    baseName: baseName
    location: location
    logAnalyticsId: logAnalytics.outputs.id
  }
}

module app './modules/containerApp.bicep' = {
  name: '${baseName}-app'
  scope: rg
  params: {
    baseName: baseName
    location: location
    containerImage: containerImage
    containerEnvId: env.outputs.id
  }
}
