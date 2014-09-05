Habitapp.User = DS.Model.extend
  name: DS.attr 'string'
  email: DS.attr 'string'
  password: DS.attr 'string'
  habits: DS.hasMany 'habit'
  createdAt: DS.attr 'string',
    defaultValue: -> new Date()

Habitapp.User.reopen
  attributes: ( ->
    model = this
    Ember.keys(this.get('data')).map (key) ->
      Em.Object.create({ model: model, key: key, valueBinding: 'model.' + key })
  ).property()

Habitapp.User.FIXTURES = [
  id: 0
  name: 'foo'
  email: 'foo'
  password: 'foo'
,
  id: 1
  name: 'foo'
  email: 'foo'
  password: 'foo'
]


