Habitapp.UserRoute = Ember.Route.extend(
  model: (params) ->
    @get('store').find('user', params.user_id)
)

