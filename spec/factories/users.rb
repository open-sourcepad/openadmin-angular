# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  bank_id             :integer
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  encrypted_password  :string(255)
#  access_token        :string(255)
#  position            :string(255)
#  super_admin         :boolean
#  is_active           :boolean          default(TRUE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  role_id             :integer
#  department          :string(255)
#  timezone            :string(255)
#  participation_count :integer          default(0)
#

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password "password1"
  end
end

