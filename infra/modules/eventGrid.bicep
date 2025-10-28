param baseName string
param location string

resource eventGrid 'Microsoft.EventGrid/topics@2022-06-15' = {
  name: '${baseName}-eg'
  location: location
}

output id string = eventGrid.id
