Ctrl = ($scope,$state,User,growl,$http,Auth)->

  $scope.collection = []


  $scope.register=(user)->
    User.save({user: user}).$promise
      .then (data)->
        growl.success(MESSAGES.REGISTER_SUCCESS)

  $scope.delete=(user)->
    swal(DELETE_WARNING).then (isConfirm) ->
      return unless isConfirm

Ctrl.$inject = ['$scope','$state','User','growl','$http','Auth']
angular.module('client').controller('RegisterCtrl', Ctrl)
