angular.module('client').config [
  '$stateProvider','$locationProvider','$urlRouterProvider'
  ($stateProvider,$locationProvider,$urlRouterProvider) ->

    $stateProvider
      .state 'admin.users',
        url: '/users',
        template: '<div ui-view></div>'
        abstract: true

      .state 'admin.users.index',
        url: '',
        templateUrl: 'pages/users/index/index.html'
        controller: 'UsersIndexCtrl'


]
