# IIoT Bicep Repo (modular)

This repo contains a modular Bicep setup to deploy:
- 2 Log Analytics workspaces
- Azure Container Registry (ACR)
- Key Vault
- Event Grid Topic
- Container Apps Environment
- Container App

Structure:
```
bicep/
├── main.bicep
├── parameters.json
└── modules/
    ├── logAnalytics.bicep
    ├── containerRegistry.bicep
    ├── keyVault.bicep
    ├── eventGrid.bicep
    ├── containerEnv.bicep
    └── containerApp.bicep
```

## Deploying locally with Azure CLI
1. Login: `az login` (or use `az login --use-device-code` on headless)
2. Choose subscription: `az account set -s <subscriptionId>`
3. Deploy:
   ```
   az deployment group create \
     --resource-group <your-rg> \
     --template-file main.bicep \
     --parameters @parameters.json
   ```

## GitHub Actions
Provided workflow uses a service principal stored in `AZURE_CREDENTIALS` secret.

- Create a secret `AZURE_CREDENTIALS` in your repo containing the JSON created by:
  `az ad sp create-for-rbac --name "github-actions-iiot" --role contributor --scopes /subscriptions/<subId>/resourceGroups/<rg>`

Example:
```json
{
  "clientId": "...",
  "clientSecret": "...",
  "subscriptionId": "...",
  "tenantId": "..."
}
```

Workflow will run on pushes to `main` and deploy `main.bicep` with `parameters.json`.
