require 'rails_helper'
include SessionsHelper

RSpec.describe SessionsController, type: :controller do
  context 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'render template "new"' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  context 'POST #create' do
    let(:user) { User.create(email: Faker::Internet.email, password: 123, password_confirmation: 123, role: :user) }

    it 'should authorize valid user' do
      post :create, params: { session: { email: user.email, password: 123 } }

      expect(response).to redirect_to(root_path)
      expect(current_user).not_to be(nil)
    end

    it 'should render new for invalid user' do
      post :create, params: { session: { email: user.email, password: 1234 } }

      expect(response).to render_template(:new)
    end

    it 'should destroy session' do
      post :create, params: { session: { email: user.email, password: 123 } }

      expect(response).to redirect_to(root_path)
      expect(current_user).not_to be(nil)

      delete :destroy
      expect(response).to redirect_to(root_path)
      #expect(current_user).to be(nil)
    end
  end
end
