Habitapp.HabitsRoute = Ember.Route.extend(
  model: ->
    @get('store').find('habit')

  setupController: (controller, model) ->
    @_super controller, model
    controller.set 'habits', model
)

