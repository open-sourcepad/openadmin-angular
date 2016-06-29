Ctrl = ($scope,$state,Session,growl,$http,Auth)->

  $scope.uiState =
    loading: false

  $scope.login =(creds)->
    $scope.uiState.loading = true
    Session.login(credentials: creds).$promise
      .then (data) ->
        Auth.setUser(data)
        Session.setSession(data)
        Session.setHeaders(data)
        growl.success(MESSAGES.LOGIN_SUCCESS)
        $state.go("admin.users.index")
      .finally ->
        $scope.ctrl.loading = false


Ctrl.$inject = ['$scope','$state','Session','growl','$http','Auth']
angular.module('client').controller('LoginCtrl', Ctrl)
