Habitapp.Router.map( ->

  @resource('habits', ->
    @resource('habit', path: '/:habit_id', ->
      @route('edit')
    )
    @route('create')
  )

)
