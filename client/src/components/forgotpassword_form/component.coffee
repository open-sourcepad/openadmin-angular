Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    @.email = ""

  ctrl.submit =(form)->
    debugger
    form.$submitted = true
    if form.$valid
      @.forgot({data: @.email})
      @.$onInit()
  return

angular.module('client').component 'forgotpasswordForm',
  templateUrl: 'components/forgotpassword_form/index.html'
  controller: Ctrl
  bindings:
    forgot: "&"
