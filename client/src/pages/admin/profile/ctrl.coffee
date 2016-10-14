Ctrl = ($scope,$state)->
  $scope.user = angular.copy($scope.currentUser)


Ctrl.$inject = ['$scope','$state']
angular.module('client').controller('ProfileCtrl', Ctrl)
