Habitapp.ResetRoute = Ember.Route.extend
  setupController: (controller, model) ->
    @_super controller, model
    habitapp = localStorage.getItem 'habitapp'
    localStorage.removeItem 'habitapp'
    date = moment().format('YYYY-MM-DD-HH-MM')
    localStorage.setItem 'habitapp_bak_' + date, habitapp
    window.location.href = ''