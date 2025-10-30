param location string
param environment string
param eventGridNamespaceName string

resource eventGridNamespace 'Microsoft.EventGrid/namespaces@2022-06-15' = {
  name: eventGridNamespaceName
  location: location
  tags: {
    Environment: environment
  }
}
