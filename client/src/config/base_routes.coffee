angular.module('client').config [
  '$stateProvider','$locationProvider','$urlRouterProvider'
  ($stateProvider,$locationProvider,$urlRouterProvider) ->

    $locationProvider.html5Mode(true)
    $urlRouterProvider.otherwise('auth/login')
]
