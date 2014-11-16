class Teacher < ActiveRecord::Base
  has_many :votes
  
  def to_s
    first_name + " " + last_name
  end
  
  def knowledge_sharing
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.knowledge_sharing }).to_f / votes.size
    else
      0
    end
  end
  
  def passing_difficulty
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.passing_difficulty }).to_f / votes.size
    else
      0
    end
  end
  
  def justice
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.justice }).to_f / votes.size
    else
      0
    end
  end
  
  def jokes_level
    if votes.size > 0
      (votes.inject(0) { |sum, vote| sum + vote.jokes_level }).to_f / votes.size
    else
      0
    end
  end
end
