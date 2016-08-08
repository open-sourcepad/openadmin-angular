angular.module('client').run [
  '$rootScope','$location','$state','$window','$http','Session','Auth', ($rootScope,$location,$state,$window,$http,Session,Auth,SidebarToggles) ->

    $rootScope.authenticatorFlag = true
    $rootScope.bodyClass = "condensed"

    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      Session.setHeaders() if $http.defaults.headers.common.AccessToken is undefined

      if !!toState.data.sub_menu
        $rootScope.activeSidebar = toState.data.sub_menu
      else
        $rootScope.activeSidebar = ""

      if toState.data.unauthenticated && !!$http.defaults.headers.common.AccessToken
        $state.go("admin.dashboard")
      else if toState.data.authenticated && $rootScope.authenticatorFlag
        event.preventDefault()
        $rootScope.authenticatorFlag = false
        if(user = Auth.getUser())
          $state.go(toState.name, toParams)
        else
          Session.getCurrentUser().$promise
            .then (data) ->
              Auth.setUser(data)
              $state.go(toState.name, toParams)

]
