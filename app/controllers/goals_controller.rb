class GoalsController < ApplicationController
  @@user

  def index
    @@user = User.find(params[:user_id])
  end

  def create
    if params[:google].present?
      @@user.goal = 'Google'
    elsif params[:localjob].present?
      @@user.goal = 'LocalJob'
    elsif params[:internship].present?
      @@user.goal = 'Internship'
    elsif params[:idk].present?
      @@user.goal = 'idk'
    end
    @@user.save
    redirect_to timeline_index_path(user_id: @@user.id)
  end
end
