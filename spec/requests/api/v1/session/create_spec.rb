require 'rails_helper'

describe "POST /api/session" do
  let!(:user) {current_user}

  def post_request(creds)
    post '/api/session', {credentials: creds}
  end

  describe 'active user' do
    before do
      post_request({email: "test@test.com", password: "password"})
    end

    it 'returns success stat' do
      expect(response.status).to eq 200
    end

    it 'returns session information' do
      expect(json_response["email"]).to eq "test@test.com"
      expect(json_response["access_token"]).to be_present
    end
  end

  describe 'inactive user' do
    before do
      current_user.update({is_active: false})
      post_request({email: "test@test.com", password: "password"})
    end

    it 'returns access denied' do
      expect(response.status).to eq 401
    end
  end

end
