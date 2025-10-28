param baseName string
param location string

resource law 'Microsoft.OperationalInsights/workspaces@2021-06-01' = {
  name: '${baseName}-law'
  location: location
  sku: {                // ✅ Correct placement — outside properties
    name: 'PerGB2018'
  }
  properties: {
    retentionInDays: 30
  }
}

output id string = law.id
