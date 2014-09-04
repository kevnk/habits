Habitapp.HabitItemView = Em.View.extend(
  tagName: 'li'
  templateName: 'habit_item_view'
  displayTitle: Ember.computed.alias 'content.title'

  actions:
    saveHabitTitle: (habit) ->
      model = @get('controller.model').find (model) ->
        habit is model

      if model
        if title = @$().find('input').val()
          model.set('title', title)
        else
          model.deleteRecord()
        model.save()

)