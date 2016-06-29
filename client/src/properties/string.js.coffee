String::formatDate = ->
  if !!this.toString() then moment(new Date(this.toString())).format(DATE_FORMAT) else moment()

String::formatTimestamp = ->
  if !!this.toString() then moment(new Date(this.toString())).format(TIMESTAMP_FORMAT) else  moment()

# because there is no trim() in IE8 SUCKSSSS
String::trim = ->
  @replace /^\s+|\s+$/g, ''

String::toFloat = ->
  parseFloat(this)

String::formatMoney = ->
  parseFloat(this).formatMoney()

String::removeUnderscore = ->
  this.replace(/_/g, ' ')

String::capitalize = ->
  @replace /(?:^|\s)\S/g, (a) ->
    a.toUpperCase()

String::toPercent = ->
  util_label = @.split("/")
  parseFloat(((util_label[0]/util_label[1])*100).formatMoney())
