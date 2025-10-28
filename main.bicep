@description('Location for all resources')
param location string = resourceGroup().location

@description('Base name prefix (e.g., iiot-sandbox-wus)')
param baseName string

@description('Enable admin user for ACR')
param enableAdminUser bool = true

@description('Container image tag (fully qualified)')
param containerImage string = ''

@description('Container CPU')
param containerCpu float = 0.5

@description('Container memory')
param containerMemory string = '1Gi'

// --- MODULES ---
module logAnalytics1 './modules/logAnalytics.bicep' = {
  name: 'logAnalytics1'
  params: {
    name: 'law-${baseName}-001'
    location: location
  }
}

module logAnalytics2 './modules/logAnalytics.bicep' = {
  name: 'logAnalytics2'
  params: {
    name: 'workspacerg${baseName}00187f2'
    location: location
  }
}

module acr './modules/containerRegistry.bicep' = {
  name: 'acr'
  params: {
    name: 'iiotsandboxreg'
    location: location
    enableAdminUser: enableAdminUser
  }
}

module kv './modules/keyVault.bicep' = {
  name: 'keyvault'
  params: {
    name: 'iiot-sandbox-keyvault'
    location: location
  }
}

module evt './modules/eventGrid.bicep' = {
  name: 'eventgrid'
  params: {
    name: 'event-grid-${baseName}-001'
    location: location
  }
}

module env './modules/containerEnv.bicep' = {
  name: 'containerEnv'
  params: {
    name: 'container-app-env-${baseName}-001'
    location: location
    workspaceId: logAnalytics1.outputs.customerId
    workspaceKey: logAnalytics1.outputs.primaryKey
  }
}

module app './modules/containerApp.bicep' = {
  name: 'containerApp'
  params: {
    name: 'container-app-iiot-sandbox'
    location: location
    envId: env.outputs.environmentId
    acrLoginServer: acr.outputs.loginServer
    containerImage: containerImage
    containerCpu: containerCpu
    containerMemory: containerMemory
  }
}

output acrLoginServer string = acr.outputs.loginServer
output containerAppId string = app.outputs.appId
output keyVaultId string = kv.outputs.keyVaultId
