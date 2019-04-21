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
    @user.save!
    if !@user.steps.present?
      generate_steps
    end
  end

  def create
    if params[:'1'].present?
      @step = Step.find_by step_id:'1'
      @step.update_attribute(:content, '<strike><h1 id="step1">Step 1: Work on personal projects</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step1'
    elsif params[:'2'].present?
      @step = Step.find_by step_id:'2'
      @step.update_attribute(:content, '<strike><h1 id="step2">Step 2: Network</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step2'
    elsif params[:'3'].present?
      @step = Step.find_by step_id:'3'
      @step.update_attribute(:content, '<strike><h1 id="step3">Step 3: Go to conferences</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step3'
    elsif params[:'4'].present?
      @step = Step.find_by step_id:'4'
      @step.update_attribute(:content, '<strike><h1 id="step4">Step 4: Write a resume</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step4'
    elsif params[:'5'].present?
      @step = Step.find_by step_id:'5'
      @step.update_attribute(:content, '<strike><h1 id="step5">Step 5: Get resume feedback</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step5'
    elsif params[:'6'].present?
      @step = Step.find_by step_id:'6'
      @step.update_attribute(:content, '<strike><h1 id="step6">Step 6: Learn what employers expects you to know</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step6'
    elsif params[:'7'].present?
      @step = Step.find_by step_id:'7'
      @step.update_attribute(:content, '<strike><h1 id="step7">Step 7: Apply</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step7'
    elsif params[:'8'].present?
      @step = Step.find_by step_id:'8'
      @step.update_attribute(:content, '<strike><h1 id="step8">Bonus: Salary negotiation resources</h1></strike>')
      @step.update_attribute(:status, 'done')
      anchor = 'step8'
    end
    redirect_to timeline_index_path(anchor: anchor)
  end
end
