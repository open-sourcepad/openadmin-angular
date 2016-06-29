Ctrl = ($scope,$state,User)->

  $scope.currentUser = null

  $scope.uiState =
    loading: false
    count: 0
    userModal: false

  $scope.active_search =
    is_active: null
    approved: null
    role: null

  $scope.order =
    by: 'email'
    direction: false

  $scope.collection = []

  $scope.getData =(page)->
    User.getList(page: page).$promise
      .then (data)->
        $scope.collection = data.collection
        $scope.uiState.count = data.count


  $scope.toggleModal =(obj)->
    $scope.currentUser = obj !!obj
    $scope.uiState.userModal = !$scope.uiState.userModal

  $scope.getData(1)


Ctrl.$inject = ['$scope','$state','User']
angular.module('client').controller('UsersIndexCtrl', Ctrl)
