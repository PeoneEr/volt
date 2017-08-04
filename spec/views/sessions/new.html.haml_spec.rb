require 'rails_helper'

RSpec.describe "sessions/new.html.haml", type: :view do
  it 'should have form' do
    render

    expect(rendered).to have_selector('form', class: 'simple_form session')
  end
end
