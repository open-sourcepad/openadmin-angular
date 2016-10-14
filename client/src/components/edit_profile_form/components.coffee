Ctrl = (User,growl)->
  ctrl = this

  ctrl.editMode = false
  ctrl.tempValue = angular.copy(ctrl.fieldValue)
  ctrl.$onInit = ->
    @.fieldType = if !!ctrl.fieldType then ctrl.fieldType else "text"
    @.fieldName = if !!ctrl.fieldName then ctrl.fieldName else ""
    @.fieldPlaceholder = if !!ctrl.fieldPlaceholder then ctrl.fieldPlaceholder else ctrl.fieldName
    @.fieldLength = if !!ctrl.fieldLength then ctrl.fieldLength else ''
    @.editMode = if !!ctrl.editMode then ctrl.editMode else false
    return

  ctrl.setEditMode = ->
    ctrl.tempValue = angular.copy(ctrl.fieldValue)
    ctrl.editMode = true

  ctrl.cancelEditMode = ->
    ctrl.fieldValue = angular.copy(ctrl.tempValue)
    ctrl.editMode = false

  ctrl.submit =(form)->
    form.$submitted = true
    if form.$valid
      User.update({id: ctrl.user.id, user: ctrl.user}).$promise
        .then (data)->
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
    user: "<"