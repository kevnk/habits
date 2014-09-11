Habitapp.HabitsController = Ember.ObjectController.extend Habitapp.StatsMixin,
  habits: []
  marks: []
  hasAccessedMarks: false

  hasPastData: ( ->
    @get('habits').any (habit) ->
      day = moment(Date.parse(habit.get('createdAt'))).format('YYYYMMDD')
      day < moment().format('YYYYMMDD')
  ).property 'marks.@each'

  todaysMarks: ( ->
    @get('marks').filterBy 'day', moment().format('YYYY-MM-DD')
  ).property 'marks.@each'

  setMarks: ( ->
      # TODO: eventually these marks will only be marks attributed to the user, not ALL marks
      # But for now, all the marks belong to this user
    @set 'marks', @get('store').find('mark')
    @set 'hasAccessedMarks', true
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