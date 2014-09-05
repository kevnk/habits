Habitapp.StatsMixin = Ember.Mixin.create
  avgStyle: ( ->
    'height:' + @get('height') + 'px;'
  ).property 'height'

  height: ( ->
    h = $('.avg-container').height()
    avg = parseFloat @get('finalAvg')
    h * (avg/100)
  ).property 'finalAvg', 'displayAvg'

  finalAvg: ( ->
    Math.round(@get('average') * 100)
  ).property 'average'

  lastAvg: 0
  startingAvg: 0

  displayAvg: ( ->
    lastAvg = @get('lastAvg')
    finalAvg = @get('finalAvg')
    runningDelta = Math.abs(finalAvg - lastAvg)
    finalDelta = Math.abs(finalAvg - @get('startingAvg'))
    timeDelta = 1 - (runningDelta / finalDelta)
    Ember.run.cancel @goingUp
    Ember.run.cancel @goingDown
    # The average is going up
    if lastAvg < finalAvg and runningDelta > 1
      @goingUp = Ember.run.later =>
        @set 'lastAvg', lastAvg + 1
      , timeDelta * 100
      (lastAvg + 1) + '%'
    # The average is going down
    else if lastAvg > finalAvg and runningDelta > 1
      @goingDown = Ember.run.later =>
        @set 'lastAvg', lastAvg - 1
      , timeDelta * 100
      (lastAvg - 1) + '%'
    # The running average reached the finalAvg
    else
      @set 'startingAvg', finalAvg
      finalAvg + '%'
  ).property 'finalAvg', 'lastAvg'

  average: ( ->
    habits = @get('habits')
    habitsLen = habits.get('length')
    habitsAvgs = []
    avg = 0
    habits.forEach (habit) ->
      marks = habit.get('marks')
      marksLen = marks.get('length')
      startDate = moment( Date.parse(habit.get('createdAt')) )
      daysSinceStart = moment().diff(startDate, 'days') + 1 # Add 1 to count today
      habitsAvgs.push marksLen / daysSinceStart
    if habitsAvgs.length
      avg = habitsAvgs.reduce( (a,b) -> a + b ) / habitsAvgs.length
    avg
  ).property 'habits.@each', 'marks.@each'