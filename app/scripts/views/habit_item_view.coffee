Habitapp.HabitItemView = Em.View.extend(
  tagName: 'li'
  templateName: 'habit_item_view'

  $input: ( ->
    @$().find('input[type=text]').first()
  ).property()

  # Store the model on this view for better use
  model: ( ->
    habit = @get('content')
    @get('controller.model').find (model) ->
      model is habit
  ).property 'content'

  displayTitle: Ember.computed.alias 'content.title'

  setHabitOrder: ( ->
    @send 'saveHabitOrder', @get('content'), @get('contentIndex')
  ).observes 'contentIndex'

  actions:
    saveHabitTitle: (habit) ->
      if model = @get('model')
        if title = @get('$input').val().trim()
          model.set('title', title)
        else
          model.deleteRecord()
        model.save()

    saveHabitOrder: (habit, newIdx) ->
      if model = @get('model')
        model.set('idx', newIdx)
        model.save()

)