Ctrl = ->
  ctrl = this

angular.module('client').filter 'range', ->
  debugger
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
      debugger
      $scope.pageCount = Math.ceil($scope.count/DEFAULT_PER_PAGE)
      $scope.pageCount = 1 if $scope.pageCount == 0
    $scope.queryPage =(params)->
      debugger
      if params == 'prev'
        $scope.page--
      else if params == 'next'
        $scope.page++
      else
        $scope.page = params
      $scope.onChange({page: $scope.page})
