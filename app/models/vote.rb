class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :idea


  def self.vote_limit(user, idea_id)
    count = Vote.where(user_id: user.id).where(cohort_id: user.cohort_id).count
    count < 3
  end

end
