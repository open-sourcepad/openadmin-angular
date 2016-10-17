angular.module('client').config [
  '$stateProvider','$locationProvider','$urlRouterProvider'
  ($stateProvider,$locationProvider,$urlRouterProvider) ->

    $locationProvider.html5Mode(true)

    $stateProvider
      .state 'auth',
        url: '/auth',
        templateUrl: 'pages/auth/index.html'
        abstract: true
        # data:
        #   authenticated: true

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

      .state 'auth.forgot_password',
        url: '/forgot_password',
        templateUrl: 'pages/auth/forgot_password/index.html'
        controller: 'ForgotPasswordCtrl'
        data:
          unauthenticated: true

      .state 'auth.reset_password',
        url: '/reset_password?token=:verify_token',
        templateUrl: 'pages/auth/reset_password/index.html'
        controller: 'ResetPasswordCtrl'
        data:
          unauthenticated: true

]
