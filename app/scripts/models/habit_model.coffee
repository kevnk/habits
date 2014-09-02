#global Ember
Habitapp.Habit = DS.Model.extend(
  title: DS.attr("string")
  idx: DS.attr("number")
)

# probably should be mixed-in...
Habitapp.Habit.reopen attributes: (->
  model = this
  Ember.keys(@get("data")).map (key) ->
    Em.Object.create
      model: model
      key: key
      valueBinding: "model." + key


).property()

# delete below here if you do not want fixtures
Habitapp.Habit.FIXTURES = [
  {
    id: 0
    title: "foo"
    idx: 0
  }
  {
    id: 1
    title: "bar"
    idx: 1
  }
]