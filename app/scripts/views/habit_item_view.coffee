Habitapp.HabitItemView = Em.View.extend(
  tagName: 'li'
  templateName: 'habit_item_view'

  $input: ( ->
    @$().find('input[type=text]').first()
  ).property()

  $checkbox: ( ->
    @$().find('input[type=checkbox]').first()
  ).property()

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
          marks = habit.get('marks').filterBy 'day', moment().format('YYYY-MM-DD')
          marks.forEach (mark) ->
            mark.deleteRecord()
            mark.save()
          habit.save()

    saveHabitTitle: (habit) ->
      if habit = @get('habit')
        if title = @get('$input').val().trim()
          habit.set('title', title)
        else
          habit.get('marks').forEach (mark) ->
            mark.deleteRecord()
            mark.save()
          habit.deleteRecord()
        habit.save()

    saveHabitOrder: (newIdx) ->
      if habit = @get('habit')
        habit.set('idx', newIdx)
        habit.save()

)