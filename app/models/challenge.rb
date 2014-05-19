class Challenge < ActiveRecord::Base
  mount_uploader :answerPic, AnswerPicUploader
  scope :approved, -> { where(:approved => true) }
  scope :not_approved, -> { where.not(:approved => true) }
end
