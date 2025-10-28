param baseName string
param location string

resource kv 'Microsoft.KeyVault/vaults@2023-07-01' = {
  name: '${baseName}-kvvv'
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: []
    enabledForDeployment: true
    enabledForTemplateDeployment: true
    enabledForDiskEncryption: true
  }
}

output id string = kv.id
