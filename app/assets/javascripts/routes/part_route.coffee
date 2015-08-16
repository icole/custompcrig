Custompcrig.PartRoute = Ember.Route.extend
	model: (params) ->
		this.store.find('part', params.id)
