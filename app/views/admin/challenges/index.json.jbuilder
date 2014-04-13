json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :date, :title, :text, :comments, :enabled, :answerPic, :answerText
  json.url challenge_url(challenge, format: :json)
end
