Ctrl = ($scope,$state,User,growl,$http,Auth)->

  $scope.uiState =
    form: true

  $scope.forgot =(data)->
    User.forgotPassword(email: data).$promise
      .then (data)->
        $scope.uiState.form = false
        growl.success("Sent a link to your email to reset your password")


Ctrl.$inject = ['$scope','$state','User','growl','$http','Auth']
angular.module('client').controller('ForgotPasswordCtrl', Ctrl)
