Custompcrig.Part = DS.Model.extend
    type_name: DS.attr()
    manufacturer: DS.attr()
    model: DS.attr()
    details: DS.attr()
    link: DS.attr()
    description: DS.attr()
    amzdesc: DS.attr()
    amzprice: DS.attr()
    amzshipping: DS.attr()
    incompatibleparts: DS.attr()
    compatibility: DS.attr()
    formattedprice: (->
      price = parseFloat(@get('amzprice'), 10).toFixed(2)
      price = price.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")
      return price
    ).property('amzprice')
    price: (->
      return @get('amzprice')
    ).property('amzprice')
    name: (->
      return @get('manufacturer') + " " + @get('model') + " " + @get('details')
    ).property('manufacturer', 'model', 'details')
    imageurl: (->
      return "/assets/parts/" + @get('id') + ".png"
    ).property('id')
