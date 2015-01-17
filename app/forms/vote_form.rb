class VoteForm
  include ActiveModel::Model
  include Virtus.model

  attr_reader :vote

  attribute :user_id, Integer
  attribute :teacher_id, Integer
  attribute :knowledge_sharing, Integer
  attribute :passing_difficulty, Integer
  attribute :justice, Integer
  attribute :jokes_level, Integer

  validates :knowledge_sharing, :inclusion => 1..5
  validates :passing_difficulty, :inclusion => 1..5
  validates :justice, :inclusion => 1..5
  validates :jokes_level, :inclusion => 1..5
  validate :one_vote_per_teacher_per_user

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private
  def one_vote_per_teacher_per_user
    if Vote.where(:teacher_id => teacher_id, :user_id => user_id).exists?
      errors.add(:teacher_id, "You can't have two votes on one teacher!")
    end
  end

  def persist!
    @vote = Vote.create!(user_id: user_id, teacher_id: teacher_id, knowledge_sharing: knowledge_sharing,
                         passing_difficulty: passing_difficulty, justice: justice, jokes_level: jokes_level)
  end

end