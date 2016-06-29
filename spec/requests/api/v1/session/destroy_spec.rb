require 'rails_helper'

describe "DELETE /api/session" do
  let!(:user) {current_user}

  before do
    auth_delete '/api/session'
  end

  it 'returns success stat' do
    expect(response.status).to eq 200
  end

  it 'returns success message' do
    expect(json_response.count).to eq 1
    expect(json_response["success"]).to be_truthy
  end

  it 'invalidates user access token' do
    get '/api/session', nil, {AccessToken: user.access_tokens.first.value}

    expect(json_response.count).to eq 1
    expect(json_response["error"]).to eq "Your session has expired"
  end

end
