param baseName string
param location string
param sku string

resource law 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: '${baseName}-law'
  location: location
  properties: {
    sku: {
      name: sku
    }
    retentionInDays: 30
  }
}

output id string = law.id
