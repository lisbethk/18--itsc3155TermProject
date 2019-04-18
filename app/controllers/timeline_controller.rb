class TimelineController < ApplicationController
  include LogoutHelper
  include TimelineHelper

  def index
    @user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    elsif session[:userinfo].present?
      @user_auth = session[:userinfo]
      curr_email = @user_auth["info"]["name"]
      @user = User.find_by email:@user_auth["info"]["name"] 
    end
    
    if !@user.steps.present?
      @user.save!
      generate_steps
    end
  end
end
