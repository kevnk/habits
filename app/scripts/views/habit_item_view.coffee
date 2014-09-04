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
  model: ( ->
    habit = @get('content')
    @get('controller.model').find (model) ->
      model is habit
  ).property 'content'

  displayTitle: Ember.computed.alias 'content.title'
  markedToday: Ember.computed.alias 'content.markedToday'

  setHabitOrder: ( ->
    @send 'saveHabitOrder', @get('contentIndex')
  ).observes 'contentIndex'

  actions:
    toggleMarkedToday: ->
      if model = @get('model')
        markedToday = @get('$checkbox').prop('checked')
        model.set 'markedToday', markedToday
        model.save()

    saveHabitTitle: (habit) ->
      if model = @get('model')
        if title = @get('$input').val().trim()
          model.set('title', title)
        else
          model.deleteRecord()
        model.save()

    saveHabitOrder: (newIdx) ->
      if model = @get('model')
        model.set('idx', newIdx)
        model.save()

)