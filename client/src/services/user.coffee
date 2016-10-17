module = ($resource)->

  User = $resource "/api/users/:id", {id: "@id"},
    {
      update:
        method: 'PUT'
      getList:
        url: "/api/users"
        method: 'get'
        isArray: false
      forgotPassword:
        url: "/api/users/forgot_password"
        method: 'PUT'
      resetPassword:
        url: "/api/users/reset_password"
        method: 'PUT'
      verify:
        url: "/api/users/verify_reset_token"
        method: 'get'
        isArray: false
      updatePassword:
        url: "/api/users/:id/update_password"
        method: 'PUT'
      updateAvatar:
        url: "/api/users/:id/update_avatar"
        method: 'POST'
        transformRequest: angular.identity
        headers: 'Content-Type': undefined
    }


module.$inject = ['$resource']
angular.module('client').factory('User', module)
