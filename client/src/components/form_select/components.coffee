Ctrl = ($scope, $element, $attrs) ->

  ctrl = this
  element = $element

  ctrl.$onInit = ->
    @.optionValue = if !!ctrl.optionValue then ctrl.optionValue else "value"
    @.optionName = if !!ctrl.optionName then ctrl.optionName else "name"
    @.fieldName = if !!ctrl.fieldName then ctrl.fieldName else ""
    return

  ctrl.hasError = ->
    return false unless !!@.form
    return false unless @.form.$submitted
    true if @.isRequired && (!@.fieldValue || @.fieldValue.toString().trim() == '')

  return

Ctrl.$inject = ['$scope','$element','$attrs']

angular.module('client').component 'formSelect',
  templateUrl: 'components/form_select/input.html'
  controller: Ctrl
  bindings:
    fieldValue: "="
    fieldName: "@?"
    form: "<"
    isRequired: "@?"
    options: "="
    optionValue: "@?"
    optionName: "@?"
    onChange: "&"
