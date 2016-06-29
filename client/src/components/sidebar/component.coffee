Ctrl =($scope,SidebarToggles,Auth,$rootScope)->

  $scope.currentUser = Auth.getUser()
  $scope.setActive =(active)->
    if active == $rootScope.activeSidebar
      $rootScope.activeSidebar = ""
    else
      $rootScope.activeSidebar = active

    SidebarToggles.toggle() if angular.element(document).find('body').hasClass("condensed")

    return

  return


Ctrl.$inject = ['$scope','SidebarToggles','Auth','$rootScope']

angular.module('client').directive 'sidebar',->
  restrict: "E"
  templateUrl: 'components/sidebar/index.html'
  controller: Ctrl
