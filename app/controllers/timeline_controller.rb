class TimelineController < ApplicationController
  include LogoutHelper
  include TimelineHelper

  def index
    @user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
    elsif session[:userinfo].present?
      @user_auth = session[:userinfo]
      @user = User.find_by email:@user_auth["info"]["name"]
    end
    @user.save!
    if !@user.steps.present?
      generate_steps
    end
  end

  def create
    @user_auth = session[:userinfo]
    @user = User.find_by email:@user_auth["info"]["name"]
    if params[:'1'].present?
      @step = @user.steps.find_by step_id:'1'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step1">Step 1: Work on personal projects</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step1">Step 1: Work on personal projects</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
    anchor = 'step1'
    
    elsif params[:'2'].present?
      @step = @user.steps.find_by step_id:'2'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step2">Step 2: Network</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step2">Step 2: Network</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
    anchor = 'step2'

    elsif params[:'3'].present?
      @step = @user.steps.find_by step_id:'3'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step3">Step 3: Go to conferences</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step3">Step 3: Go to conferences</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
    anchor = 'step3'
    
    elsif params[:'4'].present?
      @step = @user.steps.find_by step_id:'4'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step4">Step 4: Write a resume</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step4">Step 4: Write a resume</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
      anchor = 'step4'

    elsif params[:'5'].present?
      @step = @user.steps.find_by step_id:'5'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step5">Step 5: Get resume feedback</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step5">Step 5: Get resume feedback</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
      anchor = 'step5'

    elsif params[:'6'].present?
      @step = @user.steps.find_by step_id:'6'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step6">Step 6: Learn what employers expects you to know</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step6">Step 6: Learn what employers expects you to know</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
      anchor = 'step6'

    elsif params[:'7'].present?
      @step = @user.steps.find_by step_id:'7'
      if @step.content.include? "strike"
        @step.update_attribute(:content, '<h1 id="step7">Step 7: Apply</h1>')
        @step.update_attribute(:status, '')
      else
        @step.update_attribute(:content, '<strike><h1 id="step7">Step 7: Apply</h1></strike>')
        @step.update_attribute(:status, 'done')
      end
      anchor = 'step7'
    end

    redirect_to timeline_index_path(anchor: anchor)
  end
end
