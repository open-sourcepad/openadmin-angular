Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    @.status = STATUS_OPTIONS

  return

angular.module('client').component 'usersTable',
  templateUrl: 'components/users_table/index.html'
  controller: Ctrl
  bindings:
    collection: "="
    searchFilter: "="
    order: "="
    page: "="
    destroy: "&"
    edit: "&"
    search: "&"
