class ClassStandingController < ApplicationController
  def index

  end

  def create
    @User = User.new
    if params[:freshman].present?
      @User.standing = "freshman"
    elsif params[:sophomore].present?
      @User.standing = "sophomore"
    elsif params[:junior].present?
      @User.standing = "junior"
    elsif params[:senior].present?
      @User.standing = "senior"
    elsif params[:nontraditional].present?
      @User.standing = "nonTraditional"
    end
    @User.experience = "noExperience"
    @User.goal = "big4"
    @User.save
    redirect_to timeline_index_path(:user_id => @User.id)
  end
end
