angular.module('client').config [
  '$stateProvider','$locationProvider','$urlRouterProvider'
  ($stateProvider,$locationProvider,$urlRouterProvider) ->

    $locationProvider.html5Mode(true)

    $stateProvider
      .state 'auth',
        url: '/auth',
        templateUrl: 'pages/auth/index.html'
        abstract: true

      .state 'auth.login',
        url: '/login',
        templateUrl: 'pages/auth/login/index.html'
        controller: 'LoginCtrl'
        data:
          unauthenticated: true

      .state 'auth.register',
        url: '/register',
        templateUrl: 'pages/auth/register/index.html'
        controller: 'RegisterCtrl'
        data:
          unauthenticated: true
]
