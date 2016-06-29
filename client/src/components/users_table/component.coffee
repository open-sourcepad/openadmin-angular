Ctrl = ->
  ctrl = this


  return



angular.module('client').component 'usersTable',
  templateUrl: 'components/users_table/index.html'
  controller: Ctrl
  bindings:
    collection: "="
