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

  aasm column: :state do
    state :new, initial: true
    state :started
    state :finished

    event :to_new do
      transitions to: :new
    end

    event :to_started do
      transitions to: :started
    end

    event :to_finished do
      transitions to: :finished
    end
  end

  mount_uploader :file, FileUploader

  def file_image?
    return false unless file?

    %w[jpg jpeg png bmp].include?(file.file.extension)
  end
end
