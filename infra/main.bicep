param baseName string
param location string = resourceGroup().location
param containerImage string

module containerEnv './modules/containerEnv.bicep' = {
  name: 'containerEnv'
  scope: resourceGroup()
  params: {
    baseName: baseName
    location: location
  }
}

module containerApp './modules/containerApp.bicep' = {
  name: 'containerApp'
  scope: resourceGroup()
  params: {
    baseName: baseName
    location: location
    containerImage: containerImage
    containerEnvId: containerEnv.outputs.environmentId
  }
}

module eventGrid './modules/eventGrid.bicep' = {
  name: 'eventGrid'
  scope: resourceGroup()
  params: {
    baseName: baseName
    location: location
  }
}

module keyVault './modules/keyVault.bicep' = {
  name: 'keyVault'
  scope: resourceGroup()
  params: {
    baseName: baseName
    location: location
  }
}

module containerRegistry './modules/containerRegistry.bicep' = {
  name: 'containerRegistry'
  scope: resourceGroup()
  params: {
    baseName: baseName
    location: location
  }
}

module logAnalytics './modules/logAnalytics.bicep' = {
  name: 'logAnalytics'
  scope: resourceGroup()
  params: {
    baseName: baseName
    location: location
  }
}
