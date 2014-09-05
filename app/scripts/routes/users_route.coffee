Habitapp.UsersRoute = Ember.Route.extend(
  model: ->
    @get('store').find('user')
)

