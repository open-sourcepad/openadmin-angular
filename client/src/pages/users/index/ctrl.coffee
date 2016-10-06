Ctrl = ($scope,$state,User,growl,Auth)->

  $scope.currentUser = null

  $scope.uiState =
    loading: false
    count: 0
    userModal: false
    mode: ''
    page: 1

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
    if $scope.uiState.mode is 'edit'
      User.update(id: obj.id,user: obj).$promise
        .then (data)->
          growl.success(MESSAGES.UPDATE_SUCCESS)
        .catch (err)->
          debugger
    else if $scope.uiState.mode is 'new'
      User.save(user: obj).$promise
        .then (data)->
          growl.success(MESSAGES.UPDATE_SUCCESS)
        .catch (err)->
          debugger

    $scope.uiState.userModal = !$scope.uiState.userModal
    $scope.getData($scope.uiState.page)

  $scope.destroy =(obj)->
    User.delete(id: obj.id).$promise
      .then (data)->
        growl.success(MESSAGES.DELETE_SUCCESS)
        $scope.getData($scope.uiState.page)
      .catch (err)->
        debugger

  $scope.search =(obj)->
    User.searchList(obj).$promise
      .then (data)->
        $scope.collection = data.collection
        $scope.uiState.count = data.count

  $scope.onChange =(page)->
    $scope.getData(page)


  $scope.toggleModal =(obj,mode)->
    if !!obj
      $scope.currentUser = obj
    else
      $scope.currentUser = null
    $scope.uiState.userModal = !$scope.uiState.userModal
    $scope.uiState.mode = mode

  $scope.getData($scope.uiState.page)


Ctrl.$inject = ['$scope','$state','User','growl','Auth']
angular.module('client').controller('UsersIndexCtrl', Ctrl)
