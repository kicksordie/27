class VotesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @votes = Vote.all
    respond_with(@votes)
  end

  def show
    respond_with(@vote)
  end

  def new
    @vote = Vote.new
    respond_with(@vote)
  end

  def edit
  end

  def create
    @vote = VoteForm.new(vote_params)
    @vote.user_id = current_user.id
    respond_to do |format|
      if @vote.save
        format.html do
          redirect_to root_url
        end
      end
    end
  end

  def update
    @vote.update(vote_params)
    respond_with(@vote)
  end

  def destroy
    @vote.destroy
    respond_with(@vote)
  end

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end

    def vote_params
      params.require(:vote).permit(:knowledge_sharing, :passing_difficulty, :justice, :jokes_level, :teacher_id, :user_id)
    end
end
