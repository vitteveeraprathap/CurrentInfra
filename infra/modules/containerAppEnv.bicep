param location string
param environment string
param containerAppEnvName string

resource containerAppEnv 'Microsoft.App/managedEnvironments@2025-02-02-preview' = {
  name: containerAppEnvName
  location: location
  identity: {
    type: 'SystemAssigned'
  }
  properties: {
    zoneRedundant: false
    publicNetworkAccess: 'Enabled'
    appLogsConfiguration: {}
  }
  tags: {
    Environment: environment
    Owner: 'OTT GDC Amc'
  }
}
