json.array!(@votes) do |vote|
  json.extract! vote, :id, :knowledge_sharing, :passing_difficulty, :justice, :jokes_level, :teacher_id, :user_id
  json.url vote_url(vote, format: :json)
end
