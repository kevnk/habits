Habitapp.Router.map( ->

  @resource('habits', path: '/', ->
    @resource('habit', path: '/:habit_id')
    @route('create')
  )

  @route('reset')

  @resource('users', ->
    @resource('user', path: '/:user_id', ->
      @route('edit')
    )
    @route('create')
  )

)