Habitapp.HabitsView = Ember.View.extend

  $habitList: ( ->
    @$().find('.habit-list').first()
  ).property()

  actions:
    makeSortable: ->
      console.log("%c 'makeSortable' -->", 'color:#F80', 'makeSortable')
      controller = @get('controller')
      @get('$habitList').sortable
        opacity: 0.7
        axis: 'y'
        update: ->
          indexes = {}

          $(this).find('.habit-container').each (idx) ->
            indexes[$(this).data('idx')] = idx

          # $(this).sortable 'cancel'

          controller.send 'updateSortOrder', indexes

