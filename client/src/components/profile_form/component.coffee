Ctrl = ->
  ctrl = this


angular.module('client').component 'profileForm',
  templateUrl: 'components/profile_form/index.html'
  controller: Ctrl
  bindings:
    user: "="
