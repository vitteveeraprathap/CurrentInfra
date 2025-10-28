targetScope = 'resourceGroup'

param baseName string
param location string = resourceGroup().location
param containerImage string

// Deploy container environment
module containerEnv './modules/containerEnv.bicep' = {
  name: 'containerEnv'
  params: {
    baseName: baseName
    location: location
  }
}

// Deploy Container App
module containerApp './modules/containerApp.bicep' = {
  name: 'containerApp'
  params: {
    baseName: baseName
    location: location
    containerImage: containerImage
    containerEnvId: containerEnv.outputs.environmentId
  }
}

// Deploy Container Registry
module containerRegistry './modules/containerRegistry.bicep' = {
  name: 'containerRegistry'
  params: {
    baseName: baseName
    location: location
  }
}

// Deploy Log Analytics
module logAnalytics './modules/logAnalytics.bicep' = {
  name: 'logAnalytics'
  params: {
    baseName: baseName
    location: location
  }
}

// Deploy Key Vault
module keyVault './modules/keyVault.bicep' = {
  name: 'keyVault'
  params: {
    baseName: baseName
    location: location
  }
}

// Deploy Event Grid
module eventGrid './modules/eventGrid.bicep' = {
  name: 'eventGrid'
  params: {
    baseName: baseName
    location: location
  }
}
