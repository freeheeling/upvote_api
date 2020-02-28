class Api::V1::VotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    #require "pry"; binding.pry
    idea = Idea.find(params[:id])
    if Vote.vote_limit(current_user, idea.id)
      Vote.create!(user_id: current_user.id, idea_id: idea.id, cohort_id: current_user.cohort_id)
      idea.vote_count += 1
      idea.save
    end
    #redirect_to "#{ENV['FRONTEND']}/cohorts/ideas"
  end

  def show
    stats = Statistics.new(current_user)
    render json: {data: stats.statistics}
  end

  def voting_limit
    #endpoint needsd
  end

end
