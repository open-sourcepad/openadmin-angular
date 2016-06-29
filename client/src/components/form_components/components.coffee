Ctrl = ($scope, $element, $attrs) ->

  ctrl = this
  element = $element

  ctrl.$onInit = ->
    @.fieldType = if !!ctrl.fieldType then ctrl.fieldType else "text"
    @.fieldName = if !!ctrl.fieldName then ctrl.fieldName else ""
    @.fieldPlaceholder = if !!ctrl.fieldPlaceholder then ctrl.fieldPlaceholder else ctrl.fieldName
    return

  ctrl.hasError = ->
    return false unless !!@.form
    return false unless @.form.$submitted
    true if @.isRequired && (!@.fieldValue || @.fieldValue.trim() == '')

  return

Ctrl.$inject = ['$scope','$element','$attrs']

angular.module('client').component 'formInput',
  templateUrl: 'components/form_components/input.html'
  controller: Ctrl
  bindings:
    fieldValue: "="
    fieldType: "@?"
    fieldName: "@?"
    fieldPlaceholder: "@?"
    onEnter: "&"
    form: "<"
    isRequired: "@"
