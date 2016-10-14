class AddEMailVerificationToken < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :email_verification_token, :string
  end
end
