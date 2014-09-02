Habitapp.HabitsRoute = Ember.Route.extend(
  model: ->
    @get('store').find('habit')
)

