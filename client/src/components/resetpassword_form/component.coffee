Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    @.password =
      new: ''
      confirm_new: ''

  ctrl.submit =(form)->
    form.$submitted = true
    if form.$valid
      @.reset({data: @.password})

  return

angular.module('client').component 'resetpasswordForm',
  templateUrl: 'components/resetpassword_form/index.html'
  controller: Ctrl
  bindings:
    reset: "&"
