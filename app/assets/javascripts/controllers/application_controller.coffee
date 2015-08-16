Custompcrig.ApplicationController = Ember.ArrayController.extend
    cost: 0
    partList: []
    expandedParts: false

    groupedResults: (->
        result = []
        @get('content').forEach (item) ->
            hasType = result.findBy('type_name', item.get('type_name'))
            unless hasType
                result.pushObject Ember.Object.create(
                    type_name: item.get('type_name')
                    display: 'collapsed'
                    selected: false
                    contents: []
                )
            result.findBy('type_name', item.get('type_name')).get('contents').pushObject item
            return
        result
    ).property('content.[]')

    formattedPriceDollars: (->
        price = @get('cost')
        formatted = parseFloat(price, 10).toFixed(2)
        formatted = formatted.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
        return '$' + formatted
    ).property('cost')

    actions:
        expand: (type) ->
            @set('expandedParts', true)
            @get('groupedResults').forEach (item) ->
              item.set('display', 'collapsed')
            @get('groupedResults').findBy('type_name', type).set('display', 'expanded')
        removePart: (part) ->
            @set('cost', Number(@get('cost')) - Number(part.get('price')))
            @get('partList').removeObject(part)
            @resetCompatibility()
            @resetChoosen(part.get('type_name'))
        emptyBuild: ->
            @set('partList', [])
            @set('cost', 0)
            @resetChoosen('all')

    resetCompatibility: ->
      for part1 in @get('partList')
        for part2 in @get('partList')
          if (part1.get('incompatibleparts').indexOf String(part2.id)) > -1
            part1.set('compatibility', 'incompatible')
            part2.set('compatibility', 'incompatible')
          else
            part1.set('compatibility', 'compatible')
            part2.set('compatibility', 'compatible')

    resetChoosen: (type) ->
      found = false
      if @get('partList').length == 0
        @get('groupedResults').forEach (part) ->
          if part.type_name == type || type == 'all'
            part.set('selected', false)
      else
        for part in @get('partList')
          if part.get('type_name') == type || type == 'all'
            found = true
        unless found
          @get('groupedResults').forEach (part) ->
            if part.type_name == type || type == 'all'
              part.set('selected', false)
