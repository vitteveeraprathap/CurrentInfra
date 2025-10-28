param name string
param location string
param envId string
param acrLoginServer string
param containerImage string
param containerCpu float
param containerMemory string

resource app 'Microsoft.App/containerApps@2023-05-01' = {
  name: name
  location: location
  properties: {
    managedEnvironmentId: envId
    configuration: {
      ingress: {
        external: true
        targetPort: 80
      }
    }
    template: {
      containers: [
        {
          name: 'iiot-app'
          image: containerImage
          resources: {
            cpu: containerCpu
            memory: containerMemory
          }
        }
      ]
    }
  }
}

output appId string = app.id
