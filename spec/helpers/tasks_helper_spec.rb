require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TasksHelper. For example:
#
# describe TasksHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TasksHelper, type: :helper do
  context 'show_file' do
    let(:task) { Task.create(name: Faker::Internet.email, user_id: 1) }

    it 'should return nil if task file is empty' do
      expect(helper.show_file(task)).to eq(nil)
    end

    it 'should return img tag if file is image' do
      task.file = File.open('img.jpg', 'r')
      task.save!(validate: false)

      expect(helper.show_file(task)).not_to eq(nil)
      expect(helper.show_file(task)).to have_selector('img')
    end

    it 'should return link_to tag if file is image' do
      task.file = File.open('pdf.pdf', 'r')
      task.save!(validate: false)

      expect(helper.show_file(task)).not_to eq(nil)
      expect(helper.show_file(task)).to have_selector('a')
    end
  end
end
