Ctrl = ->
  ctrl = this

  ctrl.$onInit = ->
    @.searchFilter =
      first_name: ""
      last_name: ""
      email: ""
      is_active: ""
      page: 1
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
    page: "="
    destroy: "&"
    edit: "&"
    search: "&"
