require 'rails_helper'

RSpec.describe 'Session', type: :request do
  describe 'GET session#new' do
    it 'should have status 200' do
      get new_session_path
      expect(response).to have_http_status(200)
    end
  end
end
