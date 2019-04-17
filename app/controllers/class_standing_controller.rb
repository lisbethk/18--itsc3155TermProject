class ClassStandingController < ApplicationController
  def index; end

  def create
    @user = User.new
    if params[:freshman].present?
      @user.standing = 'freshman'
    elsif params[:sophomore].present?
      @user.standing = 'sophomore'
    elsif params[:junior].present?
      @user.standing = 'junior'
    elsif params[:senior].present?
      @user.standing = 'senior'
    elsif params[:nontraditional].present?
      @user.standing = 'nonTraditional'
    end
    @user.experience = 'hasInternship'
    @user.goal = 'Internship'
    @user.save
    redirect_to goals_path(user_id: @user.id)
  end
end
