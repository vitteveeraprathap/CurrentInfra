param baseName string
param location string

resource law 'Microsoft.OperationalInsights/workspaces@2023-09-01' = {
  name: '${baseName}-law'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

// Use listKeys() to fetch shared key after deployment
output id string = law.id
output customerId string = law.properties.customerId
output sharedKey string = listKeys(resourceId('Microsoft.OperationalInsights/workspaces', law.name), '2020-08-01').primarySharedKey
