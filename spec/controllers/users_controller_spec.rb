require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'render template "new"' do
      get :new
      expect(response).to render_template(:new)
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'POST #create' do
    it 'redirect to root_path if success' do
      post :create, params: { user: { email: Faker::Internet.email, password: 12_345, password_confirmation: 12_345, role: :user } }

      expect(response).to redirect_to(root_path)
    end

    it 'render new if failure' do
      post :create, params: { user: { email: Faker::Internet.email, role: :user } } # missing password param

      expect(response).to render_template(:new)
    end
  end
end
