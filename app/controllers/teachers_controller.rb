class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :vote, :update, :destroy]

  respond_to :html

  def index
    @teachers = Teacher.all
    respond_with(@teachers)
  end
  
  def ranking
    @teachers = Teacher.all
    respond_with(@teachers)
  end

  def show
    respond_with(@teacher)
  end

  def new
    @teacher = Teacher.new
    respond_with(@teacher)
  end
  
  def vote
    @vote = @teacher.votes.find_by_user_id(current_user.id)
    if @vote.nil?
      @vote = Vote.new
    end
    respond_with(@vote)
  end

  def edit
  end

  def create
    @teacher = Teacher.new(teacher_params)
    @teacher.save
    respond_with(@teacher)
  end

  def update
    @teacher.update(teacher_params)
    respond_with(@teacher)
  end

  def destroy
    @teacher.destroy
    respond_with(@teacher)
  end

  private
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name)
    end
end
