module = ($resource,$http)->

  Session = $resource "/api/session", null,
    {
      login:
        method: 'POST'

      getCurrentUser:
        method: 'GET'
        isArray: false

      logout:
        method: 'DELETE'
    }

  Session.setSession =(data)->
    localStorage.setItem("access_token", data.access_token)
    localStorage.setItem("user_id", data.id)

  Session.setHeaders =(data)->
    $http.defaults.headers.common.AccessToken = localStorage.getItem('access_token') || null
    $http.defaults.headers.common.UserId = localStorage.getItem('user_id') || null

  Session.resetDatepickers = ->
    $(".daterangepicker").each ->
      $(this).remove()

  Session

module.$inject = ['$resource','$http']

angular.module('client').factory('Session', module)
