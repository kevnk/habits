Habitapp.StatsMixin = Ember.Mixin.create
  setHabitAvgData: ( ->
    today = moment()
    @get('habits').forEach (habit) ->
      startDate = moment( Date.parse(habit.get('createdAt')) )
      daysSinceStart = parseFloat(today.format('YYYYMMDD')) - parseFloat(startDate.format('YYYYMMDD'))

      marks = habit.get('marks')
      pastMarks = marks.filter (item) ->
        item.get('day') isnt today.format('YYYY-MM-DD')

      habit.set('avgPast', pastMarks.get('length') / daysSinceStart) if daysSinceStart
      habit.set 'avgNow', marks.get('length') / (daysSinceStart + 1)
  ).observes 'habits.@each', 'marks.@each'

  # --------------------------------------------------------
  # CURRENT AVERAGES
  # --------------------------------------------------------

  avgStyle: ( ->
    'height:' + @get('height') + 'px;'
  ).property 'height'

  height: ( ->
    h = $('.avg-container').height()
    avg = parseFloat @get('displayAvg')
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
    avg = 0
    if habitsLen = @get('habits.length')
      habitsAvgs = @get('habits').getEach('avgNow').filter (val) -> val
      if habitsAvgs.length
        avg = habitsAvgs.reduce((a,b) -> a + b) / habitsLen
    avg
  ).property 'habits.@each', 'marks.@each'


  # --------------------------------------------------------
  # PAST AVERAGES
  # --------------------------------------------------------

  pastAverage: ( ->
    avg = 0
    if habitsLen = @get('habits.length')
      habitsAvgs = @get('habits').getEach('avgPast').filter (val) -> val
      if habitsAvgs.length
        avg = habitsAvgs.reduce((a,b) -> a + b) / habitsLen
    avg
  ).property 'habits.@each', 'marks.@each'

  finalPastAvg: ( ->
    Math.round(@get('pastAverage') * 100)
  ).property 'pastAverage'

  changeIsNegative: ( ->
    parseFloat(@get('displayAvgChange')) < 0
  ).property 'displayAvgChange'

  changeIsZero: ( ->
    parseFloat(@get('displayAvgChange')) is 0
  ).property 'displayAvgChange'

  lastAvgChange: 0
  startingAvgChange: 0

  avgChange: ( ->
     @get('finalAvg') - @get('finalPastAvg')
  ).property 'finalPastAvg', 'finalAvg'

  displayAvgChange: ( ->
    if @get('finalAvg') is @get('startingAvg')
      lastAvgChange = @get('lastAvgChange')
      avgChange = @get('avgChange')
      runningDelta = Math.abs(avgChange - lastAvgChange)
      finalDelta = Math.abs(avgChange - @get('startingAvgChange'))
      timeDelta = 1 - (runningDelta / finalDelta)
      Ember.run.cancel @avgChangeGoingUp
      Ember.run.cancel @avgChangeGoingDown
      # The average is going up
      if lastAvgChange < avgChange and runningDelta > 1
        @avgChangeGoingUp = Ember.run.later =>
          @set 'lastAvgChange', lastAvgChange + 1
        , timeDelta * 200
        (lastAvgChange + 1) + '%'
      # The average is going down
      else if lastAvgChange > avgChange and runningDelta > 1
        @avgChangeGoingDown = Ember.run.later =>
          @set 'lastAvgChange', lastAvgChange - 1
        , timeDelta * 200
        (lastAvgChange - 1) + '%'
      # The running average reached the avgChange
      else
        @set 'startingAvgChange', avgChange
        avgChange + '%'
    else
      @get('startingAvgChange') + '%'
  ).property 'avgChange', 'lastAvgChange', 'finalAvg', 'startingAvg'


