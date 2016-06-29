Date::getWeekOfMonth = (exact) ->
  month = @getMonth()
  year = @getFullYear()
  firstWeekday = new Date(year, month, 1).getDay()
  lastDateOfMonth = new Date(year, month + 1, 0).getDate()
  offsetDate = @getDate() + firstWeekday - 1
  index = 1
  weeksInMonth = index + Math.ceil((lastDateOfMonth + firstWeekday - 7) / 7)
  week = index + Math.floor(offsetDate / 7)
  return week if exact or week < 2 + index
  if week == weeksInMonth then 5+index else week
