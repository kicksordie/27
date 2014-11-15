class RateController < ApplicationController
  def index
    @teachers = Teacher.all
  end
end
