class Vote < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :user
  
  validates :knowledge_sharing, :inclusion => 1..5
  validates :passing_difficulty, :inclusion => 1..5
  validates :justice, :inclusion => 1..5
  validates :jokes_level, :inclusion => 1..5
  validates_uniqueness_of :user_id, scope: :teacher_id
end
