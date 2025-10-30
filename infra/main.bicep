targetScope = 'subscription'

@description('Deployment location')
param location string = 'westus2'

@description('Environment name (qa/uat/prod)')
param environment string

@description('Key Vault name')
param keyVaultName string

@description('Container Registry name')
param registryName string

@description('Container App Environment name')
param containerAppEnvName string

@description('Event Grid Namespace name')
param eventGridNamespaceName string

@description('Log Analytics Workspace name')
param logAnalyticsWorkspaceName string

module kv './modules/keyvault.bicep' = {
  name: 'deploy-keyvault-${environment}'
  params: {
    location: location
    environment: environment
    keyVaultName: keyVaultName
  }
}

module acr './modules/containerRegistry.bicep' = {
  name: 'deploy-registry-${environment}'
  params: {
    location: location
    environment: environment
    registryName: registryName
  }
}

module cae './modules/containerAppEnv.bicep' = {
  name: 'deploy-containerappenv-${environment}'
  params: {
    location: location
    environment: environment
    containerAppEnvName: containerAppEnvName
  }
}

module eventGrid './modules/eventGridNamespace.bicep' = {
  name: 'deploy-eventgrid-${environment}'
  params: {
    location: location
    environment: environment
    eventGridNamespaceName: eventGridNamespaceName
  }
}

module logAnalytics './modules/logAnalyticsWorkspace.bicep' = {
  name: 'deploy-law-${environment}'
  params: {
    location: location
    environment: environment
    logAnalyticsWorkspaceName: logAnalyticsWorkspaceName
  }
}
