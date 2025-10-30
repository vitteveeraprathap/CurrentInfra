param location string
param environment string
param registryName string

resource containerRegistry 'Microsoft.ContainerRegistry/registries@2025-05-01-preview' = {
  name: registryName
  location: location
  sku: {
    name: 'Basic'
  }
  tags: {
    Environment: environment
    Application: 'Container registry'
    'Application-Owner': 'Veera'
  }
}
