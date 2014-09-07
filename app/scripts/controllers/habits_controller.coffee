Habitapp.HabitsController = Ember.ObjectController.extend Habitapp.StatsMixin,
  habits: []
  marks: []

  setMarks: ( ->
      # TODO: eventually these marks will only be marks attributed to the user, not ALL marks
      # But for now, all the marks belong to this user
    @set 'marks', @get('store').find('mark')
  ).observes 'habits.@each'

  actions:
    addNewHabit: (value) ->
      model = @get('model')
      store = model.get('store')
      habit = store.createRecord('habit', {
        idx: model.get('length') + 1
        title: value
      })
      habit.save()
      # TODO - focus on that input
      @set 'newHabitValue', ''