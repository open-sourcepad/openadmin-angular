module = angular.module("NgActive", [])


module.directive 'ngActive', [
  '$location'
  ($location) ->
    restrict: 'A'
    link: ($scope, $element, $attrs) ->
      $scope.location = $location
      $scope.$watch 'location.$$url', (currentUrl) ->
        if $element.attr("href") == $location.$$path.split("/").splice(0,3).join("/")
          $element.addClass 'active'
        else
          $element.removeClass 'active'
]
