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

class Task < ApplicationRecord
  belongs_to :user # presence true by default

  validates :name, presence: true

  scope :ordered_by_id, -> { order(:id) }

  include AASM

  mount_uploader :file, FileUploader

  def file_image?
    %w[jpg jpeg png bmp].include?(file.file.extension)
  end
end
