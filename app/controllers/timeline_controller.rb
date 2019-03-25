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
    # STEP1: Work on personal projects
    @step = @user.steps.create(:content=>"Work on personal projects")
    if @user.experience == "hasInternship"
        @step.extra = "• Having personal projects in addition to work experience will let you showcase your passion for development "\
        "and people want to work with someone who cares about the work they do."\
        "\n• If your internship was not in the area where you want to find work "\
        "(DevOps instead of Dev or front-end when you want to work with back-end) "\
        "personal projects give you space to expand on those interests."
    elsif @user.experience == "hackathons"
        @step.extra = "• Highlight your Hackathon projects/summer research on your resume"
    else
        @step.extra = "• If you do not have any relevant experience "\
        "personal projects will help you present yourself as a software developer."\
        "\n- Focus on where you want to be and build something relevant to that "\
        "(if you don't want to be a game developer maybe don't make a tic-tac-toe)"\
        "\n- Use your school work as a starting point."\
        "\n- Consider following online project-based courses if you haven't worked on a project yet. "\
        "Try out different courses and platforms to find something that works for you."\
        "(<a href=\"https://skillcrush.com/2016/03/15/64-online-resources-to-learn-to-code-for-free/\">list of resources</a>)"\
        end
    @step.extra << "\n- Check out other resumes for project ideas:"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 1</a>"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 2</a>"


    # STEP2: Write a resume
    @step = @user.steps.create(:content=>"Write a resume")
    @step.extra = "• A recruiter spends 20 seconds looking over a resume. Make sure your resume is worth a closer look."\
        "\n• Do not ignore formatting and spell checking. "\
        "People will judge a book but its cover and if your resume looks like you spent a total of 10 minutes on it even the most exciting content might get overlooked."\
        "\n• Use bullet points, action verbs, highlighting achievements instead of writing out your job descriptions "\
        "(\"saved 42 kittens from a burning building\" vs \"put out fires\")"\
        "\n• Stick to one page"        

    if @user.standing == "freshman"
        @step.extra << "\n• Remove highshool from your resume"
    elsif @user.standing == "nonTradidional"
        @step.extra << "\n• Leverage your unique experience but keep the focus on Computer Science"
    end
    @step.extra << "\n• Examples: <a href=\"http://macalinao.github.io/resume/resume.pdf\">#1</a>,"\
    "<a href=\"http://dierkers.com/docs/Resume.pdf\">#2</a>,"\
    "<a href=\"https://maeganclawges.com/MaeganClawgesResume.pdf\">#3</a>,"\
    "<a href=\"http://macalinao.github.io/resume/resume.pdf\">#4</a>"

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
