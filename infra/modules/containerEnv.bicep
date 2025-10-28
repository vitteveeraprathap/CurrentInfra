param name string
param location string
param workspaceId string
param workspaceKey string

resource env 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: name
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: workspaceId
        sharedKey: workspaceKey
      }
    }
  }
}

output environmentId string = env.id
