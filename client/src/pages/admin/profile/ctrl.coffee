Ctrl = ($scope,$state,Auth,User,growl,Upload)->

  $scope.updateUser =(obj,password,type)->
    debugger
    switch type
      when 'detail'
        User.update(id: obj.id,user: obj).$promise
          .then (data)->
            growl.success(MESSAGES.UPDATE_SUCCESS)
          .catch (err)->
            growl.success(MESSAGES.UPDATE_ERROR)
      when 'password'
        User.updatePassword(id: obj.id,old_password: password.old_password,new_password: password.new_password,confirm_password: password.confirm_password).$promise
          .then (data)->
            growl.success("Password updated")
          .catch (err)->
            growl.error(MESSAGES.UPDATE_ERROR)

  $scope.upload =(file)->
    debugger
    Upload.upload
      url: '/api/users/'+$scope.currentUser.id+'/update_avatar'
      method: 'POST'
      fields:
        'user[id]': $scope.currentUser.id
        'user[avatar]': file
      file: file
    .then (response)->
      $scope.currentUser.image_url = response.data.img_url
    .catch (err)->
      growl.error("Failed to upload image.")

  $scope.deleteAvatar =->
    User.update(id:$scope.currentUser.id, user:{avatar: null}).$promise
      .then (data)->
        $scope.currentUser.image_url = data.img_url
      .catch (err)->
        debugger

Ctrl.$inject = ['$scope','$state','Auth','User','growl','Upload']
angular.module('client').controller('ProfileCtrl', Ctrl)
