class GoalsController < ApplicationController
  @@user

  def index
    @@user = User.find(params[:user_id])
  end

  def create
    if params[:google].present?
      @@user.goal = 'big4'
    elsif params[:localjob].present?
      @@user.goal = 'localJob'
    elsif params[:internship].present?
      @@user.goal = 'internship'
    elsif params[:idk].present?
      @@user.goal = 'idk'
    end
    @@user.save
    redirect_to timeline_index_path(user_id: @@user.id)
  end
end
