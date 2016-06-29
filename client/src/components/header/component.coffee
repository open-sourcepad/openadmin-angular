Ctrl =($scope,$window,$rootScope,SidebarToggles)->

  $scope.toggleDropdown =(e)->
    e.stopPropagation() if(e)

    $scope.showDropdown = !$scope.showDropdown
    if $scope.showDropdown
      $window.onclick = (event)->
        if $scope.showDropdown
          $scope.showDropdown = false
          $scope.$apply()

  $scope.hasSubHeader =->
    "subheader-collapse" in $rootScope.bodyClass.split(' ')

  $scope.toggleSidebar = ->
    SidebarToggles.toggle()

  return

Ctrl.$inject = ['$scope','$window','$rootScope','SidebarToggles']

angular.module('client').directive 'header', ->
  templateUrl: 'components/header/index.html'
  restrict: "E"
  controller: Ctrl
  scope:
    logout: "&"
    currentUser: "="
    sidebarToggle: "&"
