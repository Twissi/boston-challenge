class Challenge < ActiveRecord::Base
  mount_uploader :answerPic, AnswerPicUploader
end
