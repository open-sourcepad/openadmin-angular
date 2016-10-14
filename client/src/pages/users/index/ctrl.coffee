Ctrl = ($scope,$state,User,growl,Auth)->

  $scope.currentUser = null

  $scope.uiState =
    loading: false
    count: 0
    userModal: false
    mode: ''
    page: 1

  $scope.searchFilter  = null

  $scope.active_search =
    is_active: null
    approved: null
    role: null

  $scope.order =
    by: 'email'
    direction: false

  $scope.collection = []

  $scope.getData =(page)->
    debugger
    User.getList(page: page).$promise
      .then (data)->
        debugger
        $scope.collection = data.collection
        $scope.uiState.count = data.count


  $scope.toggleModal =(obj, mode)->
    debugger
    $scope.currentUser = obj if !!obj
    $scope.uiState.userModal = !$scope.uiState.userModal
    $scope.uiState.mode = mode

  $scope.save =(obj)->
    debugger
    if $scope.uiState.mode is 'new'
      User.save({user: obj}).$promise
        .then (data)->
          growl.success(MESSAGES.CREATE_SUCCESS)
          $scope.uiState.page = 1
          $scope.searchFilter = $scope.getDefaultFilter()
          $scope.search($scope.searchFilter,$scope.uiState.page)
    else if $scope.uiState.mode is 'edit'
      User.update({id: obj.id,user: obj}).$promise
        .then (data)->
          growl.success(MESSAGES.UPDATE_SUCCESS)
          $scope.search($scope.searchFilter,$scope.uiState.page)

    $scope.uiState.userModal = !$scope.uiState.userModal

  $scope.getDefaultFilter = ->
    $scope.searchFilter  =
      firstName: "%"
      lastName: "%"
      email: "%"
      selectedStatus: ""
      status:
        All:
          ''
        Active:
          true
        Inactive:
          false

  $scope.destroy =(obj)->
    debugger
    if Auth.getUser().id isnt obj.id
      User.delete({id: obj.id}).$promise
        .then (data)->
          debugger
          growl.success(MESSAGES.DELETE_SUCCESS)
          debugger
          if $scope.uiState.count > 0 && $scope.uiState.page != 1
            $scope.search($scope.searchFilter,$scope.uiState.page - 1)
          else
            $scope.search($scope.searchFilter,1)
    else
      debugger
      growl.success("Cannot delete current user")

  $scope.search =(obj,page)->
    debugger
    User.getList(
      {
        email: obj.email,
        first_name: obj.firstName,
        last_name: obj.lastName,
        is_active: obj.selectedStatus
        page: page
      }
    ).$promise
      .then (data)->
        $scope.collection = data.collection
        $scope.uiState.count = data.count

  $scope.getDefaultFilter()
  $scope.search($scope.searchFilter,$scope.uiState.page)

Ctrl.$inject = ['$scope','$state','User','growl','Auth']
angular.module('client').controller('UsersIndexCtrl', Ctrl)
