class Vote < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :user
  
  validates_uniqueness_of :user_id, scope: :teacher_id
end
