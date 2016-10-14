Ctrl = ($scope,$state,Session,$http,Auth,User)->

  debugger
  $scope.password = ''
  $scope.confirm_password = ''

  $scope.showForm = false
  $scope.status = []
  $scope.user = null

  User.activate(token: $state.params.token).$promise
    .then (data)->
      debugger
      if data.errors && data.errors.length > 0
        $scope.status = data.errors
        $scope.showForm = false

      if data.success == true
        $scope.status.push("Account activated successfully!")

      $scope.user = data.user
      if !$scope.user.encrypted_password?
        $scope.showForm = true

  $scope.register=(user)->
    debugger
    User.activation_password({id: user.id, user: { password: user.password, is_active: true}}).$promise
      .then (data)->
        debugger
        $state.go('auth.activation', { token: data.token }, { reload: true })


Ctrl.$inject = ['$scope','$state','Session','$http','Auth','User']
angular.module('client').controller('ActivationCtrl', Ctrl)