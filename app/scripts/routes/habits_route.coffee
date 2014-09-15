Habitapp.HabitsRoute = Ember.Route.extend
  model: ->
    @get('store').find('habit')

  setupController: (controller, habits) ->
    controller.set 'habits', habits.sortBy('idx')
    marks = @get('store').find('mark').then (marks) ->
      controller.set 'marks', marks
      controller.set 'hasAccessedMarks', true
    @_super controller, habits



