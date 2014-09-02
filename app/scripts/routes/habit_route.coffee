Habitapp.HabitRoute = Ember.Route.extend(
  model: (params) ->
    @get('store').find('habit', params.habit_id)
)

