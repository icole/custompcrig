Ember.Handlebars.helper 'type-image', (type, selected) ->
  escaped = Handlebars.Utils.escapeExpression(type)
  if selected
    return new Ember.Handlebars.SafeString('<img class="part-type-image" src="/assets/part_types/choosen/' + escaped + '.png" alt="type-image" />')
  else
    return new Ember.Handlebars.SafeString('<img class="part-type-image" src="/assets/part_types/unchoosen/' + escaped + '.png" alt="type-image" />')
