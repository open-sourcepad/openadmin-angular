env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']
set :output, "#{path}/log/cron.log"

every 5.minutes do
  rake "scrapper:ci_and_cc"
  #rake "bank_issue:check_date"
  #rake "action_plan:check_date"
  #rake "bank_issue:check_status"
end
