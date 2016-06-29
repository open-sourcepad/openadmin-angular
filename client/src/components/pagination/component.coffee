
angular.module('client').filter 'range', ->
  (input, total) ->
    total = parseInt(total)
    i = 0
    while i < total
      input.push i+1
      i++
    input


angular.module('client').directive "pagination", ->
  restrict: "E"
  replace: true
  templateUrl: 'components/pagination/index.html'
  scope:
    count: "="
    page: "="
    onChange: "&"

  link: ($scope, element, attrs) ->
    $scope.$watch 'count', (newValue, oldValue) ->
      $scope.pageCount = Math.ceil($scope.count/DEFAULT_PER_PAGE)

    $scope.queryPage =(params)->
      if params == 'prev'
        $scope.page--
      else if params == 'next'
        $scope.page++
      else
        $scope.page = params
      $scope.onChange({page: $scope.page})
