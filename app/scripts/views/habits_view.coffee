Habitapp.HabitsView = Ember.View.extend(
  attachStatsTooltips: ( ->
    @$().find('.stats a').popover(
      html: true
    )
  ).on 'didInsertElement'
)
