class WelcomeController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    puts(@user)
  end
  def new

  end
  def create
    puts(params)
  end
end
