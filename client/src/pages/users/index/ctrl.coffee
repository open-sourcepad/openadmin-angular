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

  $scope.save =(obj)->
    User.update(id: obj.id,user: obj).$promise
      .then (data)->
        growl.success(MESSAGES.UPDATE_SUCCESS)
      .catch (err)->
        debugger

  $scope.destroy =(obj)->
    User.delete(id: obj.id).$promise
      .then (data)->
        growl.success(MESSAGES.DELETE_SUCCESS)
        $scope.getData(1)
      .catch (err)->
        debugger


  $scope.toggleModal =(obj)->
    if !!obj
      $scope.currentUser = obj
    else
      $scope.currentUser = null
    $scope.uiState.userModal = !$scope.uiState.userModal

  $scope.getData(1)


Ctrl.$inject = ['$scope','$state','User','growl','Auth']
angular.module('client').controller('UsersIndexCtrl', Ctrl)
