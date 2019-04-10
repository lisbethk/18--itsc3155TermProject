class GoalsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        puts(@user)
      end

      def create
        
        if params[:google].present?
          puts(@user)
          @user.goal = "Google"
        elsif params[:localjob].present?
          @user.goal = "LocalJob"
        elsif params[:internship].present?
          @user.goal = "Internship"
        elsif params[:idk].present?
          @user.goal = "idk"
        end
        @user.experience = "hasInternship"
        @user.save
        redirect_to timeline_index_path(:user_id => @user.id)
      end
end
