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

      .state 'admin.profile',
        url: '/profile',
        templateUrl: 'pages/admin/profile/index.html'
        controller: 'ProfileCtrl'

      .state 'admin.dashboard',
        url: '/dashboard',
        templateUrl: 'pages/dashboard/index.html'
        controller: 'DashboardCtrl'

]
