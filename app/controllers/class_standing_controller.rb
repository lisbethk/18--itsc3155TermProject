class ClassStandingController < ApplicationController
  def index
    if session[:userinfo].present?
      @user_auth = session[:userinfo]
      curr_email = @user_auth["info"]["name"]
      if User.find_by email:curr_email 
        redirect_to '/timeline'
      end
    end
  end  

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

    if session[:userinfo].present?
      @user_auth = session[:userinfo]
      @user.email = @user_auth["info"]["name"]
    end
    
    @user.save
    redirect_to experience_index_path(user_id: @user.id)
  end
end
