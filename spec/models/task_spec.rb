# == Schema Information
#
# Table name: tasks
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  user_id     :integer
#  state       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'create tasks' do
    let(:user) { User.create(email: Faker::Internet.email, password: 123, password_confirmation: 123, role: :user) }
    let(:task) { user.tasks.new(name: Faker::GameOfThrones.character, description: Faker::GameOfThrones.house) }

    it 'should create if valid' do
      expect(task.valid?).to eq(true)

      task.save
      expect(task).not_to be_new_record
    end

    it 'should have user' do
      task.save

      expect(task.user.email).to eq(user.email)
    end
  end
end
