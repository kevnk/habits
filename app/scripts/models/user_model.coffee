Habitapp.User = DS.Model.extend
  createdAt: DS.attr 'string',
    defaultValue: -> new Date()

Habitapp.User.reopen
  attributes: ( ->
    model = this
    Ember.keys(this.get('data')).map (key) ->
      Em.Object.create({ model: model, key: key, valueBinding: 'model.' + key })
  ).property()
