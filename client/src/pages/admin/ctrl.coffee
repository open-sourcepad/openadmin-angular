Ctrl = ($scope,$state,Session,growl,$window,Auth)->

  $scope.containerHeight = {'height':"#{$window.innerHeight}px"}

  $scope.ctrl =
    loading: false
    creds: {}

  $scope.currentUser = Auth.getUser()

  $scope.logout = ->
    $scope.ctrl.loading = true
    Session.logout().$promise
      .then (data) ->
        Auth.removeUser()
        growl.success(MESSAGES.LOGOUT_SUCCESS)
        $state.go("login")

Ctrl.$inject = ['$scope','$state','Session','growl','$window','Auth']
angular.module('client').controller('AdminCtrl', Ctrl)
