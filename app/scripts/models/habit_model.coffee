#global Ember
Habitapp.Habit = DS.Model.extend(
  title: DS.attr 'string'
  idx: DS.attr 'number'
  marks: DS.hasMany 'mark'
  createdAt: DS.attr 'string',
    defaultValue: -> new Date()
)