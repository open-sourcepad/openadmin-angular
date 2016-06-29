Ctrl = ->
  ctrl = this

  ctrl.sort = (orderBy) ->
    if ctrl.order.by == orderBy
      ctrl.order.direction = !ctrl.order.direction
    else
      ctrl.order.by = orderBy
      ctrl.order.direction = false

  ctrl.assessSort = ->
    if @.order && @.order.by == @.columnName
      if !@.order.direction
        "icon-car-up success"
      else
        "icon-car-down danger"
    else
      return ''

  return

angular.module('client').component 'sortable',
  templateUrl: 'components/sortable/index.html'
  controller: Ctrl
  bindings:
    columnName: "@"
    order: "="
    label: "@"
