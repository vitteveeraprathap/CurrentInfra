param baseName string
param location string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: '${baseName}acr'
  location: location
  sku: {
    name: 'Basic'    // 🔥 REQUIRED field
  }
  properties: {
    adminUserEnabled: true
  }
}

output loginServer string = containerRegistry.properties.loginServer
output registryId string = containerRegistry.id
