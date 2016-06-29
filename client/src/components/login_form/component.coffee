Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    @.creds =
      email: ''
      password: ''

  ctrl.submit =(form)=>
    form.$submitted = true
    if form.$valid
      @.login({creds: @.creds})

  return

angular.module('client').component 'loginForm',
  templateUrl: 'components/login_form/index.html'
  controller: Ctrl
  bindings:
    login: "&"
    loading: "="
