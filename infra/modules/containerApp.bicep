param baseName string
param location string
param containerImage string
param containerEnv resource

resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: '${baseName}-app'
  location: location
  properties: {
    managedEnvironmentId: containerEnv.id
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
            {
              name: 'SAMPLE_VAR'
              value: 'demo'
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
