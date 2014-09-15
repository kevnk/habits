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

      habits = Ember.A()
      @get('habits').forEach (habitItem) ->
        habits.pushObject habitItem
      habits.pushObject habit
      @set('habits', habits.sortBy('idx'))

      # TODO - focus on that input
      @set 'newHabitValue', ''

    updateSortOrder: (indexes) ->
      @get('habits').forEach (habit) ->
        habitIdx = habit.get('idx')
        newIdx = indexes[habitIdx]
        habit.set 'idx', newIdx
        habit.save()

      @set('habits', @get('habits').sortBy('idx'))
