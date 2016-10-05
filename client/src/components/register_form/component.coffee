Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    @.user =
      first_name: ""
      last_name: ""
      email: ""
      password: ""

  ctrl.submit =(form)->
    form.$submitted = true
    if form.$valid
      @.register({user: @.user})
      @.$onInit()
  return

angular.module('client').component 'registerForm',
  templateUrl: 'components/register_form/index.html'
  controller: Ctrl
  bindings:
    register: "&"
