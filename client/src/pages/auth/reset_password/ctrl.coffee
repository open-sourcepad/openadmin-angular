Ctrl = ($scope,$state,User,growl,$http,Session)->

  $scope.uiState =
    form: false

  User.verify(token: $state.params.token).$promise
    .then (data)->
      $scope.uiState.form = true
    .catch (err)->
      $scope.uiState.form = false
      growl.error("Invalid token")

  $scope.reset =(pass)->
    User.resetPassword(new_password: pass.new, confirm_password: pass.confirm_new, token: $state.params.token).$promise
      .then (data)->
        $state.go("auth.login")

Ctrl.$inject = ['$scope','$state','User','growl','$http','Session']
angular.module('client').controller('ResetPasswordCtrl', Ctrl)
