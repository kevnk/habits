Habitapp.HabitEditController = Ember.ObjectController.extend(
  needs: 'habit'
  actions:
    save: ->
      self = this
      @get('buffer').forEach (attr)->
        self.get('controllers.habit.model').set(attr.key, attr.value)
      @transitionToRoute 'habit', @get('model')
)
