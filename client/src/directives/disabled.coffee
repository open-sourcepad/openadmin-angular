module = angular.module("ToggableField", [])


module.directive 'toggableField', [
  '$location'
  ($location) ->
    restrict: 'C'
    scope:
      isDisabled: "="
    link: ($scope, $element, $attrs) ->
      $element.addClass('disabled') if !!$scope.isDisabled

]
