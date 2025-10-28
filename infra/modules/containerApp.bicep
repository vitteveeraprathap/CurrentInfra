param baseName string
param location string
param containerEnvId string
param containerImage string

resource app 'Microsoft.App/containerApps@2023-05-01' = {
  name: 'container-app-${baseName}'
  location: location
  properties: {
    environmentId: containerEnvId
    configuration: {
      activeRevisionsMode: 'Single'
    }
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: 0.5
            memory: '1Gi'
          }
        }
      ]
    }
  }
}
