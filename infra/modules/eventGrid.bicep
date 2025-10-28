param name string
param location string

resource topic 'Microsoft.EventGrid/topics@2023-06-01-preview' = {
  name: name
  location: location
  properties: {}
}

output topicId string = topic.id
