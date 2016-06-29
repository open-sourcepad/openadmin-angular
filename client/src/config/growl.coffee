angular.module('client').config [
  'growlProvider'
  (growlProvider) ->
    growlProvider.globalDisableCountDown true
    growlProvider.globalDisableIcons(true)
    growlProvider.globalDisableCloseButton(true)
    growlProvider.globalTimeToLive(2000)

]
