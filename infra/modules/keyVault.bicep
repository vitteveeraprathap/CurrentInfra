param baseName string
param location string

resource kv 'Microsoft.KeyVault/vaults@2022-07-01' = {
  name: '${baseName}-keyvault'
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'standard'
    }
    tenantId: subscription().tenantId
    accessPolicies: []
    enabledForDeployment: true
    enabledForTemplateDeployment: true
  }
}
