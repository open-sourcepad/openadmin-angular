Ctrl = ->
  ctrl = this

  ctrl.changePage =(page)->
    debugger
    @.page = page
    ctrl.search(
      {
        obj: ctrl.searchFilter, 
        page: page
      }
    )
    debugger

  return



angular.module('client').component 'usersTable',
  templateUrl: 'components/users_table/index.html'
  controller: Ctrl
  bindings:
    collection: "="
    edit: "&"
    destroy: "&"
    search: "&"
    count: "="
    page: "="
    searchFilter: "="
