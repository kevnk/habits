Habitapp.HabitItemView = Em.View.extend(
  tagName: 'li'
  classNames: 'habit-item'
  classNameBindings: ['isEditing:edit-mode']
  templateName: 'habit_item_view'
  isEditing: false

  $input: ( ->
    @$().find('input[type=text]').first()
  ).property()

  $checkbox: ( ->
    @$().find('input[type=checkbox]').first()
  ).property()

  todaysMarks: ( ->
    @get('habit').get('marks').filterBy 'day', moment().format('YYYY-MM-DD')
  ).property 'habit.marks.@each'

  markedToday: ( ->
    @get('todaysMarks').length > 0
  ).property 'todaysMarks'

  # Store the model on this view for better use
  habit: ( ->
    habit = @get('content')
    @get('controller.model').find (model) ->
      model is habit
  ).property 'content'

  displayTitle: Ember.computed.alias 'content.title'

  setHabitOrder: ( ->
    @send 'saveHabitOrder', @get('contentIndex')
  ).observes 'contentIndex'

  selectAllOnFocus: ( ->
    @get('$input').on 'click', ->
      $(this).select()
  ).on 'didInsertElement'

  actions:
    toggleMark: ->
      if habit = @get('habit')
        # If marked, create mark and save it to the habit
        if marked = @get('$checkbox').prop('checked')
          mark = habit.get('store').createRecord 'mark',
            day: moment().format('YYYY-MM-DD')
            timestamp: moment().toISOString()
            habit: habit
          habit.get('marks').addObject mark
          habit.save().then ->
            habit.get('marks').forEach (mark) ->
              mark.save()
        # Otherwise, find today's mark and remove it
        else
          marks = @get('todaysMarks')
          marks.forEach (mark) ->
            mark.deleteRecord()
            mark.save()
          habit.save()

    saveHabitTitle: (habit) ->
      if habit = @get('habit')
        if title = @get('$input').val().trim()
          habit.set('title', title)
          habit.save()
        else
          promises = Ember.A()
          habit.get('marks').forEach (mark) ->
            mark.deleteRecord()
            promises.push mark.save()

          # After all marks are deleted, then delete the habit
          Ember.RSVP.Promise.all(promises).then ->
            habit.deleteRecord()
            habit.save()

    saveHabitOrder: (newIdx) ->
      if habit = @get('habit')
        habit.set('idx', newIdx)
        habit.save()

)