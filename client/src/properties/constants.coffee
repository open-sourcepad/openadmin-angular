@DATE_FORMAT = "MMM DD, YYYY"
@DEFAULT_PER_PAGE = 20
@YEAR_FILTER_RANGE = 5

@MESSAGES =
  UPDATE_SUCCESS: "Updated successfully"
  UPDATE_ERROR: "Update error"
  CREATE_SUCCESS: "Created successfully"
  DELETE_SUCCESS: "Deleted successfully"
  INTERNAL_SERVER_ERROR: "Some crazy weird stuff happened. Fix this, we will."
  BAD_REQUEST: "Error 400, bad request"
  FORM_ERROR: "Marked fields are blank or have invalid value"
  INVALID_CREDS: "Invalid username or password"
  NO_DATA: "No more data to get"
  INVALID_FILE_SIZE: "File should be less than 10 mb"
  TIMEOUT: "Connection has timed out"
  LOGIN_SUCCESS: "Login success"
  LOGOUT_SUCCESS: "Logout success"
  NO_DATA: "No more data to get"
  NEW_NOTIFICATION: "New Notification"
  START_PREDICTING: "The risk prediction engine is now running for this exam"
  REJECT_SUCCESS: "The issue has been successfully rejected."
  CATEGORY_ERROR: "Category cannot be blank"
  LOGIN_ERROR: "Invalid email or password"
  IMPORT_SUCCESS: "Imported successfully"
  ACCESS_DENIED: "Access Denied"
  GITHUB_ERROR: "Assign github username first"
  NO_GITHUB_USERNAME: "User has no github username"

@STATUS_OPTIONS = [
  {
    value: true
    name: 'Active'
  }
  {
    value: false
    name: 'Inactive'
  }
]

@BUILD_OPTIONS = [
  {
    value: true
    name: 'Success'
  }
  {
    value: false
    name: 'Failed'
  }
]

@ACTIVATE_WARNING =
  title: 'Are you sure?'
  type: 'warning'
  showCancelButton: true
  confirmButtonColor: '#4fc95a'
  confirmButtonText: 'Yes, active this user!'
  closeOnCancel: true
  closeOnConfirm: true
  animation: true


@DEACTIVATE_WARNING =
  title: 'Are you sure?'
  type: 'warning'
  showCancelButton: true
  confirmButtonColor: '#ff604f'
  confirmButtonText: 'Yes, deactive this user!'
  closeOnCancel: true
  closeOnConfirm: true
  animation: true

@DELETE_WARNING =
  title: 'Are you sure?'
  type: 'warning'
  showCancelButton: true
  confirmButtonColor: '#ff604f'
  confirmButtonText: 'Yes, delete this record!'
  closeOnCancel: true
  closeOnConfirm: true
  animation: true

@UPDATE_WARNING =
  title: 'Are you sure?'
  type: 'warning'
  showCancelButton: true
  confirmButtonColor: '#ff604f'
  confirmButtonText: 'Yes, update all records!'
  closeOnCancel: true
  closeOnConfirm: true
  animation: true

@MONTHS = [
  {key: "1", value: "January"},
  {key: "2", value: "Feburary"},
  {key: "3", value: "March"},
  {key: "4", value: "April"},
  {key: "5", value: "May"},
  {key: "6", value: "June"},
  {key: "7", value: "July"},
  {key: "8", value: "August"},
  {key: "9", value: "September"},
  {key: "10", value: "October"},
  {key: "11", value: "November"},
  {key: "12", value: "December"}
]


@PIE_OPTIONS =(color)->
  animate:
    duration: 800
    enabled: true
  barColor: color
  scaleColor: false
  lineWidth: 6
  lineCap: 'circle'
  size: 200

@LEAVE =
  ALL: "All"
  PENDING: "Pending"
  APPROVED: "Approved"
  REJECTED: "Rejected"
  CANCELLED: "Cancelled"
