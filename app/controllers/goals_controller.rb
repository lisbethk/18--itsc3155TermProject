class GoalsController < ApplicationController
    def index
        @user = User.find(params[:user_id])
      end

      def update
        if params[:google].present?
          @User.goal = "Google"
        elsif params[:localjob].present?
          @User.goal = "LocalJob"
        elsif params[:internship].present?
          @User.goal = "Internship"
        elsif params[:idk].present?
          @User.goal = "idk"
        end
        @User.experience = "hasInternship"
        @User.save
        redirect_to timeline_index_path(:user_id => @User.id)
      end
end
