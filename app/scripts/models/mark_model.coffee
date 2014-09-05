#global Ember
Habitapp.Mark = DS.Model.extend(
  habit: DS.belongsTo 'habit'
  day: DS.attr 'string'
  createdAt: DS.attr 'string',
    defaultValue: -> new Date()
)
