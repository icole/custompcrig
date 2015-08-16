Custompcrig.PartController = Ember.ObjectController.extend
    needs: ['application']
    actions:
        addpart: (id) ->
            newpart = this.get('content')
            @get('controllers.application.partList').pushObject newpart
            #@resetCompatibility()
            @setChoosen(newpart)
            old_price = @get('controllers.application.cost')
            @set('controllers.application.cost', Number(newpart.get('amzprice')) + Number(old_price))

    resetCompatibility: ->
      for part1 in @get('controllers.application.partList')
        for part2 in @get('controllers.application.partList')
          if (part1.get('incompatibleparts').indexOf String(part2.id)) > -1
            part1.set('compatibility', 'incompatible')
            part2.set('compatibility', 'incompatible')
          else
            part1.set('compatibility', 'compatible')
            part2.set('compatibility', 'compatible')

    setChoosen: (newpart) ->
      @get('controllers.application.groupedResults').forEach (part) ->
        if newpart.get('type_name') == part.type_name
          part.set('selected', true)
