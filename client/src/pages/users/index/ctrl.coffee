Ctrl = ($scope,$state,User,growl,Auth)->

  $scope.currentUser = null

  $scope.uiState =
    loading: false
    count: 0
    userModal: false
    mode: ''
    page: 1

  $scope.active_search =
    email: ''
    first_name: ''
    last_name: ''
    is_active: null
    approved: null
    role: null

  $scope.order =
    by: 'email'
    direction: false

  $scope.collection = []

  $scope.getData =(page,user)->
    debugger
    User.getList(page: page, email: user.email, first_name: user.first_name, last_name: user.last_name,is_active: user.is_active).$promise
      .then (data)->
        $scope.collection = data.collection
        $scope.uiState.count = data.count
        growl.error(MESSAGES.NO_DATA) if $scope.uiState.count <= 0
        if $scope.collection.length == 0 && $scope.uiState.count > 0
          $scope.uiState.page = page - 1
          $scope.getData($scope.uiState.page,$scope.active_search)

  $scope.save =(obj)->
    if $scope.uiState.mode is 'edit'
      User.update(id: obj.id,user: obj).$promise
        .then (data)->
          growl.success(MESSAGES.UPDATE_SUCCESS)
        .catch (err)->
          growl.success(MESSAGES.UPDATE_ERROR)
    else if $scope.uiState.mode is 'new'
      User.save(user: obj).$promise
        .then (data)->
          growl.success(MESSAGES.CREATE_SUCCESS)
        .catch (err)->
          debugger

    $scope.uiState.userModal = !$scope.uiState.userModal
    $scope.getData($scope.uiState.page,$scope.active_search)

  $scope.destroy =(obj)->
    user = Auth.getUser()
    if user.id != obj.id
      User.delete(id: obj.id).$promise
        .then (data)->
          growl.success(MESSAGES.DELETE_SUCCESS)
          $scope.getData($scope.uiState.page,$scope.active_search)
        .catch (err)->
          debugger
    else
      growl.error("Cannot delete login user")

  $scope.toggleModal =(obj,mode)->
    $scope.tempUser = angular.copy obj if mode == 'edit'
    if !!$scope.tempUser && mode == ''
      $scope.currentUser.email = $scope.tempUser.email
      $scope.currentUser.first_name = $scope.tempUser.first_name
      $scope.currentUser.last_name = $scope.tempUser.last_name
      $scope.currentUser.is_active = $scope.tempUser.is_active
      $scope.tempUser = null
    else
      $scope.currentUser = obj
    $scope.uiState.userModal = !$scope.uiState.userModal
    $scope.uiState.mode = mode

  $scope.getData($scope.uiState.page,$scope.active_search,$scope.order)


Ctrl.$inject = ['$scope','$state','User','growl','Auth']
angular.module('client').controller('UsersIndexCtrl', Ctrl)
