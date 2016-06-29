RSpec.configure do |config|

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/fixtures/attachments"])
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/fixtures/exam_files"])
  end

end

