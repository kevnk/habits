Habitapp.User = DS.Model.extend
  createdAt: DS.attr 'string',
    defaultValue: -> new Date()