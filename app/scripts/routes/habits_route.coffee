Habitapp.HabitsRoute = Ember.Route.extend
  model: ->
    @get('store').find('habit')

  setupController: (controller, habits) ->
    @_super controller, habits
    controller.set 'habits', habits


