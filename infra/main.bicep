targetScope = 'resourceGroup'

param baseName string
param location string = resourceGroup().location
param containerImage string

// Create Log Analytics Workspace
module logAnalytics './modules/logAnalytics.bicep' = {
  name: 'logAnalytics'
  params: {
    baseName: baseName
    location: location
  }
}

// Create Container Apps Environment (linked to Log Analytics)
module containerEnv './modules/containerEnv.bicep' = {
  name: 'containerEnv'
  params: {
    baseName: baseName
    location: location
    logAnalyticsId: logAnalytics.outputs.id
    logAnalyticsCustomerId: logAnalytics.outputs.customerId
    logAnalyticsSharedKey: logAnalytics.outputs.sharedKey
  }
}

// Create Container App
module containerApp './modules/containerApp.bicep' = {
  name: 'containerApp'
  params: {
    baseName: baseName
    location: location
    containerImage: containerImage
    containerEnvId: containerEnv.outputs.environmentId
  }
}

// Optional supporting resources
module eventGrid './modules/eventGrid.bicep' = {
  name: 'eventGrid'
  params: {
    baseName: baseName
    location: location
  }
}

module keyVault './modules/keyVault.bicep' = {
  name: 'keyVault'
  params: {
    baseName: baseName
    location: location
  }
}

module containerRegistry './modules/containerRegistry.bicep' = {
  name: 'containerRegistry'
  params: {
    baseName: baseName
    location: location
  }
}
