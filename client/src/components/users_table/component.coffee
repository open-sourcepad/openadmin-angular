Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->

    @.status =[
      {
        name: "Active"
        value: true
      }
      {
        name: "Inactive"
        value: false
      }
    ]

  return

angular.module('client').component 'usersTable',
  templateUrl: 'components/users_table/index.html'
  controller: Ctrl
  bindings:
    collection: "="
    searchFilter: "="
    page: "="
    destroy: "&"
    edit: "&"
    search: "&"
