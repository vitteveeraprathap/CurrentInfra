param baseName string
param location string
param containerImage string
param containerEnvId string

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: '${baseName}-app'
  location: location
  properties: {
    managedEnvironmentId: containerEnvId
    configuration: {
      ingress: {
        external: true
        targetPort: 80
        transport: 'auto'
      }
    }
    template: {
      containers: [
        {
          name: '${baseName}-container'
          image: containerImage
          env: [
            {
              name: 'ENVIRONMENT'
              value: baseName
            }
          ]
        }
      ]
      scale: {
        minReplicas: 1
        maxReplicas: 2
      }
    }
  }
}
