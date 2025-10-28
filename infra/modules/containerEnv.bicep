param baseName string
param location string
param logAnalyticsId string

resource cae 'Microsoft.App/managedEnvironments@2023-05-01' = {
  name: 'container-app-env-${baseName}'
  location: location
  properties: {
    appLogsConfiguration: {
      destination: 'log-analytics'
      logAnalyticsConfiguration: {
        customerId: reference(logAnalyticsId, '2021-06-01').customerId
        sharedKey: listKeys(logAnalyticsId, '2021-06-01').primarySharedKey
      }
    }
  }
}

output id string = cae.id
