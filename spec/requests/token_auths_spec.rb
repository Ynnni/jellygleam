require 'rails_helper'

RSpec.describe "TokenAuth", type: :request do
  describe "POST /auth" do
    context 'register with valid params' do
      it 'return 200' do
        post user_registration_path, attributes_for(:user)
        expect(response).to have_http_status(200)
      end

      it "return auth headers" do
        post user_registration_path, attributes_for(:user)
        expect(response.headers['access-token']).to be_a String
        expect(response.headers['client']).to be_a String
        expect(response.headers['uid']).to be_a String
      end

      it 'create user' do
        expect {
          post user_registration_path, attributes_for(:user)
        }.to change(User, :count).by(1)
      end
    end

    context 'register with invalid params' do
      before do
        post user_registration_path, {email: 'fake-email@gmail.com'}
      end

      it "return 403" do
        expect(response).to have_http_status(403)
      end

      it "not return auth headers" do
        expect(response.headers['access-token']).not_to be
        expect(response.headers['client']).not_to be
        expect(response.headers['uid']).not_to be
      end
    end
  end
end
