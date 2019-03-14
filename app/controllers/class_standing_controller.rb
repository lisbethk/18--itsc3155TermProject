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
      @User.standing = "nontraditional"
    end
    @User.save
    redirect_to welcome_index_path(:user_id => @User.id)
  end
end
