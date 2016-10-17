Ctrl = ->
  ctrl = this

  ctrl.$onInit =->
    @.uiState =
      password: true
    @.change =
      old_password: ''
      new_password: ''
      confirm_password: ''

  ctrl.changeState =(state)->
    debugger
    @.uiState.password = !state

  ctrl.onSubmit =(form,type)->
    debugger
    form.$submitted = true
    if form.$valid
      @.update({obj: @.obj, password: @.change, type: type})
    @.changeState(false) if type == "password"

  ctrl.deactivate =(status)->
    @.obj.is_active = !status
    @.update({obj: @.obj})

  return

angular.module('client').component 'profileForm',
  templateUrl: 'components/profile_form/index.html'
  controller: Ctrl
  bindings:
    obj: "="
    update: "&"
