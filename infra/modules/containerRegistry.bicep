param name string
param location string
param enableAdminUser bool

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: name
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    adminUserEnabled: enableAdminUser
  }
}

output loginServer string = acr.properties.loginServer
output acrId string = acr.id
