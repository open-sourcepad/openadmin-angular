Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    debugger
    if @.mode is 'new'
      @.obj =
        first_name: ""
        last_name: ""
        email: ""
        password: ""
        is_active: false

  ctrl.onSubmit =(form)->
    debugger
    # @.obj.is_active = false unless !!@.obj.is_active
    form.$submitted = true
    if form.$valid
      this.submit({obj: @.obj})

  return



angular.module('client').component 'userModal',
  templateUrl: 'components/user_modal/index.html'
  controller: Ctrl
  bindings:
    obj: "<"
    submit: "&"
    loading: "="
    toggle: "&"
    mode: "<"
