class Teacher < ActiveRecord::Base
  has_many :votes
  
  def knowledge_sharing
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.knowledge_sharing }) / votes.size
    else
      0
    end
  end
  
  def passing_difficulty
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.passing_difficulty }) / votes.size
    else
      0
    end
  end
  
  def justice
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.justice }) / votes.size
    else
      0
    end
  end
  
  def jokes_level
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.jokes_level }) / votes.size
    else
      0
    end
  end
end
