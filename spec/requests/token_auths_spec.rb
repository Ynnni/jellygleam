require 'rails_helper'

RSpec.describe 'TokenAuth', type: :request do
  describe 'POST /auth' do
    context 'register with valid credentials' do
      it 'return 200 ok' do
        post user_registration_path, attributes_for(:user)
        expect(response).to have_http_status(200)
      end

      it 'return auth headers' do
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

    context 'register with invalid credentials' do
      before do
        post user_registration_path, { email: 'email' }
      end

      it 'return 403 forbidden' do
        expect(response).to have_http_status(403)
      end

      it 'not return auth headers' do
        expect(response.headers['access-token']).not_to be
        expect(response.headers['client']).not_to be
        expect(response.headers['uid']).not_to be
      end
    end
  end

  describe 'POST /auth/sign_in' do
    context 'log in with valid credentials' do
      it 'return 200 ok' do
        user = create :user
        post user_session_path, { email: user.email, password: user.password }
        expect(response).to have_http_status(200)
      end
    end

    context 'log in with invalid credentials' do
      it 'return 401 unauthorized' do
        post user_session_path, { email: 'email', password: 'password' }
        expect(response).to have_http_status(401)
      end
    end
  end

  describe 'DELETE /auth/sign_out' do
    context 'destroy session with valid auth headers' do
      it 'destroy user session when user signed in' do
        user = create(:user)
        delete destroy_user_session_path, {}, user.create_new_auth_token
        expect(response).to have_http_status :success
      end
    end

    context 'destroy session with invalid auth headers' do
      it 'return 404 invalid authentication' do
        delete destroy_user_session_path, {}, {}
        expect(response).to have_http_status(404)
      end

      it 'return unauthorized message' do
        delete destroy_user_session_path, {}, {}
        expect(json[:errors].first).to eq 'User was not found or was not logged in.' 
      end
    end
  end
end
