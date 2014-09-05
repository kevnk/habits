Habitapp.UserEditController = Ember.ObjectController.extend(
  needs: 'user'
  actions:
    save: ->
      self = this
      @get('buffer').forEach (attr)->
        self.get('controllers.user.model').set(attr.key, attr.value)
      @transitionToRoute 'user', @get('model')
)
