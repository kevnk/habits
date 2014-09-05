Habitapp.Router.map( ->

  @resource('habits', ->
    @resource('habit', path: '/:habit_id')
    @route('create')
  )

  @resource('users', ->
    @resource('user', path: '/:user_id', ->
      @route('edit')
    )
    @route('create')
  )

)