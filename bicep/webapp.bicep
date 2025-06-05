param location string = resourceGroup().location
param webAppName string
param sku string = 'F1'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: '${webAppName}-plan'
  location: location
  sku: {
    name: sku
    tier: sku
  }
}

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

output webAppUrl string = 'https://${webAppName}.azurewebsites.net'
