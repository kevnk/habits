Habitapp.HabitsView = Ember.View.extend(
  attachStatsTooltips: ( ->
    @$().find('.stats a.fa').popover(
      html: true
    )
  ).on 'didInsertElement'
)
