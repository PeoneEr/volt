require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users#new' do
    it 'should have status 200' do
      get new_user_path
      expect(response).to have_http_status(200)
    end
  end
end
