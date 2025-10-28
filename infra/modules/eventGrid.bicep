param baseName string
param location string

resource eg 'Microsoft.EventGrid/topics@2022-06-15' = {
  name: 'event-grid-${baseName}'
  location: location
}
