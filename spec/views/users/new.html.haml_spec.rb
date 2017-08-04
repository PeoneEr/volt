require 'rails_helper'

RSpec.describe 'users/new.html.haml', type: :view do
  it 'should have form' do
    @user = User.new
    render

    expect(rendered).to have_selector('form', class: 'simple_form new_user')
  end
end
