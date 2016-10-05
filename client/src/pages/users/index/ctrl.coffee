Ctrl = ($scope,$state,User,growl,Auth)->

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
    debugger
    $scope.currentUser = obj if !!obj
    $scope.uiState.userModal = !$scope.uiState.userModal

  $scope.destroy =(obj)->
    debugger
    if Auth.getUser().id isnt obj.id
      User.delete({id: obj.id}).$promise
        .then (data)->
          debugger
          growl.success(MESSAGES.DELETE_SUCCESS)
          $scope.getData(1)
    else
      debugger
      growl.success("Cannot delete current user")

  $scope.getData(1)


Ctrl.$inject = ['$scope','$state','User','growl','Auth']
angular.module('client').controller('UsersIndexCtrl', Ctrl)
