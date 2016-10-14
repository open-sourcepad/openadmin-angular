Ctrl =($scope,User,$http,$state,Upload)->
  ctrl = this

  $scope.avatar = ctrl.user.avatar

  $scope.uploadFiles = (file) ->
    debugger
    # fd = new FormData
    # fd.append 'user[avatar]', file
    # $http.put('/api/users/'+ctrl.user.id, fd,
    #   withCredentials: false
    #   headers: 'Content-Type': `undefined`
    #   transformRequest: angular.identity).success((data) ->
    #   debugger
    #   console.log data
    #   return
    # ).error (data) ->
    #   debugger
    #   console.log data
    #   return
    file = Upload.rename(file, 'avatar.' + file.type.split('/')[1])
    Upload.upload({
      url: '/api/users/'+ctrl.user.id+'/update_avatar',
      method: 'PUT',
      data: {user: {avatar: file}}
    }).then ((resp) ->
      #successful
      $scope.avatar = resp.data.avatar
      $scope.$apply()
      return
    ), ((resp) ->
      #error
      return
    ), (evt) ->
      #progress
      return

  return

Ctrl.$inject = ['$scope','User','$http','$state','Upload']

angular.module('client').component 'profileForm',
  templateUrl: 'components/profile_form/index.html'
  controller: Ctrl
  bindings:
    user: "="
