class TimelineController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    puts(@user.standing)
    puts(@user.experience)
    puts(@user.goal)
    generate_steps()
    @steps_array = Array.new
    @user.steps.each_with_index do |step, index|
        @steps_array[index] = step.content
    end
  end

  def generate_steps
    puts("this generates steps for user")
    # STEP1: Work on personal projects
    @step = @user.steps.create(:content=>"Work on personal projects")
    if @user.experience == "hasInternship"
        @step.extra = "Focus on your internship project it has more value. But do work on personal stuff"
    elsif @user.experience == "hackathons"
        @step.extra = "Put Hackathon projects # research on resume. But do work on personal stuff"
    else
        @step.extra = "No experience project ideas:"
    end

    # STEP2: Write a resume
    @step = @user.steps.create(:content=>"Write a resume")
    extra = ""
    if @user.standing == "freshman"
        extra = "Write a resume. Focus on extra activities (if do nothing, start), volunteering, projects. Remove high school. "
    elsif @user.standing == "nonTradidional"
        extra = "Leverage your unique experience but accent relevant CS projects and such"
    end
    @step.extra = extra + "\nCheck out these great examples:"
    #@step = @user.steps.create(:content=>"Cover letters: Quantity vs Quality - it's up to you really")
    @step = @user.steps.create(:content=>"Get resume feedback")

    # STEP3: Network
    @step = @user.steps.create(:content=>"Network")
=begin
    @step = @user.steps.create(:content=>"Have online presence. Make sure it is what you want it to be")
    @step = @user.steps.create(:content=>"Use Linkedin to find people from your school who went to companies you are interested in. Reach out")
    @step = @user.steps.create(:content=>"Go to career fairs and talk to people")
    @step = @user.steps.create(:content=>"Go to meetups")
    @step = @user.steps.create(:content=>"Use university resources to connect to industry professionals")
=end

    # STE4P: Conferences
    @step = @user.steps.create(:content=>"Go to conferences")

    # STEP5: Learn what employer expects
    @step = @user.steps.create(:content=>"Learn what employer expects")
    if  @user.goal == "big4"
        @step.extra = "Leetcode/HackerRank/Firecode \nhttps://youtu.be/YJZCUhxNCv8"
    else
        #@step = @user.steps.create(:content=>"OOP, Glassdoor questions, FizzBuzz")
    end

    # STEP6: Apply for a job
    if @user.goal == "Internship"
        if internSeason
            @step = @user.steps.create(:content=>"Apply for internships")
        else
            @step = @user.steps.create(:content=>"Focus on summer research; apply for local internships; look into summer projects; consider Fall/Winter/CoOps")
        end
    elsif @user.goal == "LocalJob"
        if @user.standing == "Senior" || @user.standing == "NonTradidional"
            @step = @user.steps.create(:content=>"Apply for local jobs")
        else
            @step = @user.steps.create(:content=>"Get an internship first.") # if Junior and too late kinda add another advice
        end
    elsif @user.goal == "Google"
        if @user.standing == "Senior" || @user.standing == "NonTradidional"
            @step = @user.steps.create(:content=>"Apply for new grad roles")
        else
            @step = @user.steps.create(:content=>"Focus on getting an internship first")
        end
    else
        @step = @user.steps.create(:content=>"Apply for jobs")
    end
    #@step = @user.steps.create(:content=>"Cold applying with always have a lower response rate")

    # STEP7: Know your level. Reach higher
    #@step = @user.steps.create(:content=>"Figure our what you can expect (MIT will get a callback from Google, UNCC won't).\n \
    #Reach for the stars anyway but focus your main effort on your next step \
    #(i.e. before getting to Google, get an internship/2 YOE)")

    # LAST_STEP:
   # @step = @user.steps.create(:content=>"If you lack people skills you have to be really good. Get some people skills")
   # @step = @user.steps.create(:content=>"If you apply to 100 places and don't get any callbacks, it's your resume (or where you are applying)")
   # @step = @user.steps.create(:content=>"If you get 10 phone interviews and no in-person invites, do mock interviews. Improve your people skills. Get honest feedback")
   # @step = @user.steps.create(:content=>"If you get in-person interviews and no offers, work on people skills, identify weak points, keep working hard")

  end

  def internSeason
    return
  end
end
