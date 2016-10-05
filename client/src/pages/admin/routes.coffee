angular.module('client').config [
  '$stateProvider','$locationProvider','$urlRouterProvider'
  ($stateProvider,$locationProvider,$urlRouterProvider) ->

    $locationProvider.html5Mode(true)

    $stateProvider
      .state 'admin',
        url: '/admin',
        templateUrl: 'pages/admin/index.html'
        controller: 'AdminCtrl'
        abstract: true
        data:
          authenticated: true

      .state 'admin.dashboard',
        url: '/dashboard',
        templateUrl: 'pages/dashboard/index.html'
        controller: 'DashboardCtrl'

]
