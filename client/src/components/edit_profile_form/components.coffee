Ctrl = (User,growl)->
  ctrl = this

  ctrl.editMode = false
  ctrl.tempValue = angular.copy(ctrl.fieldValue)
  debugger
  ctrl.$onInit = ->
    debugger
    @.fieldType = if !!ctrl.fieldType then ctrl.fieldType else "text"
    @.fieldName = if !!ctrl.fieldName then ctrl.fieldName else ""
    @.fieldPlaceholder = if !!ctrl.fieldPlaceholder then ctrl.fieldPlaceholder else ctrl.fieldName
    @.fieldLength = if !!ctrl.fieldLength then ctrl.fieldLength else ''
    @.editMode = if !!ctrl.editMode then ctrl.editMode else false
    return

  ctrl.hasError = ->
    return false unless !!@.form
    return false unless @.form.$submitted
    true if @.isRequired && (!@.fieldValue || @.fieldValue.trim() == '')

  ctrl.setEditMode = ->
    debugger
    ctrl.editMode = true

  ctrl.cancelEditMode = ->
    debugger
    ctrl.fieldValue = angular.copy(ctrl.tempValue)
    ctrl.editMode = false

  ctrl.submit =(form)->
    debugger
    User.update({id: ctrl.user.id, user: ctrl.user}).$promise
      .then (data)->
        debugger
        growl.success(MESSAGES.UPDATE_SUCCESS)
        ctrl.editMode = false

  return

Ctrl.$inject = ['User','growl']

angular.module('client').component 'editProfileForm',
  templateUrl: 'components/edit_profile_form/input.html'
  controller: Ctrl
  bindings:
    fieldValue: "="
    fieldType: "@?"
    fieldName: "@?"
    fieldPlaceholder: "@?"
    fieldLength: "@?"
    form: "<"
    user: "<"