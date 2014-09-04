Habitapp.IndexRoute = Ember.Route.extend(
  redirect: ->
    @transitionTo 'habits'
)