Ctrl = (User,growl)->
  ctrl = this

  ctrl.editMode = false
  ctrl.oldPassword = ''
  ctrl.newPassword = ''
  ctrl.confirmPassword = ''

  ctrl.setEditMode = ->
    ctrl.editMode = true

  ctrl.cancelEditMode = ->
    ctrl.editMode = false
    ctrl.oldPassword = ''
    ctrl.newPassword = ''
    ctrl.confirmPassword = ''

  ctrl.submit =(form)->
    form.$submitted = true
    
    if form.$valid
      User.updatePassword(
        {
          id: ctrl.user.id
          old_password: ctrl.oldPassword
          new_password: ctrl.newPassword
          confirm_password: ctrl.confirmPassword
        }
      ).$promise
        .then (data)->
          growl.success(MESSAGES.UPDATE_SUCCESS)
          ctrl.cancelEditMode()


  return

Ctrl.$inject = ['User','growl']

angular.module('client').component 'changePassword',
  templateUrl: 'components/change_password/index.html'
  controller: Ctrl
  bindings:
    user: "<"