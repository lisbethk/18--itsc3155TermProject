class ExperienceController < ApplicationController
    @@user

    def index
        @@user = User.find(params[:user_id])
    end

    def create
        if params[:noexperience].present?
            @@user.experience = "noExperience"
        elsif params[:someexperience].present?
            @@user.experience = "someExperience"
        elsif params[:internship].present?
            @@user.experience = "hasInternship"
        end
        @@user.save
        redirect_to goals_index_path(user_id: @@user.id)
    end
end