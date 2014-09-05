Habitapp.ApplicationRoute = Ember.Route.extend
  setupController: (controller, model) ->
    # Create a user if we don't have one
    @get('store').find('user').then (users) =>
      unless users.get('length')
        user = @get('store').createRecord 'user'
        user.save()