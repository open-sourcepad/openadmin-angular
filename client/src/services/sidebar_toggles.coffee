module = ($resource,$rootScope)->
  active = null
  {
    getActive: ->
      return active
    setActive: (obj) ->
      user = obj
      return
    toggle: ->
      body = angular.element(document).find('body')
      if body.hasClass("condensed")
        body.removeClass("condensed")
      else
        body.addClass("condensed")
        $rootScope.activeSidebar = ""
      return
  }



module.$inject = ['$resource','$rootScope']
angular.module('client').factory('SidebarToggles', module)
