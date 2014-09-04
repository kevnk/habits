Habitapp.HabitsController = Ember.ObjectController.extend(

  actions:
    addNewHabit: ->
      model = @get('model')
      store = model.get('store')
      habit = store.createRecord('habit', {
        idx: model.get('length') + 1
        title: 'New Habit'
      })
      habit.save()
      # TODO - focus on that input
)