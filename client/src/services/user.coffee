module = ($resource)->

  User = $resource "/api/users/:id", {id: "@id"},
    {
      update:
        method: 'PUT'
      updatePassword:
        url: "/api/users/:id/update_password"
        method: 'PUT'
      getList:
        url: "/api/users"
        method: 'get'
        isArray: false
      activate:
        url: "/api/users/activate_user"
        method: 'PUT'
      activation_password:
        url: "/api/users/activation_password"
        method: 'PUT'
    }


module.$inject = ['$resource']
angular.module('client').factory('User', module)
