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
        "\nPeople do judge a book but its cover so if your resume looks like you spent a total of 10 minutes on it even the most exciting content might get overlooked."\
        "\n• Use bullet points and action verbs, highlight your achievements"\
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
    @step.extra = "• Go to your university's career center"\
        "\n• If working with a third-party recruiter, ask them for feedback"\
        "\n• Post your resume on resume advice threads:"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 1</a>"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 2</a>"\
        "\nNote: If you are applying to 100+ positions and getting no call-backs stop and get more feedback"


    # STEP3: Network
    @step = @user.steps.create(:content=>"Network")

    @step.extra ="\n• Have online presence. Make sure it is what you want it to be"
    if @user.standing == "nonTradidional"
        @step.extra << "\n<a href=\"https://dev.to/jamesmh/how-to-brand-yourself-when-switching-careers-into-software-development-2ajb\">How To Brand Yourself When Switching Careers Into Software Development</a>"
    end
    @step.extra << "\n<a href=\"https://medium.freecodecamp.org/building-your-personal-brand-as-a-new-web-developer-f6d4150fd217\">How to build your personal brand as a new developer</a>"\
        "\n<a href=\"https://medium.com/@coderacademy/how-to-build-your-personal-brand-as-a-developer-877d7bdf9bdd\">How To Build Your Personal Brand As A Developer</a>"
    
    @step.extra << "\n• Use Linkedin to find people from your school who work for companies you are interested in. "\
        "\nReach out to them to learn more about their experience and the company"
    @step.extra << "\n• Go to career fairs and talk to people. "\
        "\nCheck universities in your area, they might allow students from other universities to attend as well"
    @step.extra << "\n• Go to <a href=\"https://www.meetup.com\">tech meetups</a>."\
        "\nMeetups help you become part of your local tech community, build relationships, and get exposure to new things"
    @step.extra << "\n• Use university resources to connect to industry professionals"

    # STEP4: Conferences
    @step = @user.steps.create(:content=>"Go to conferences")
    @step.extra = "• You get to learn new things from people passionate about their field"\
        "\n• You can network with engineers and hiring managers"\
        "\n• If companies you are interested in don't come to your school's career fairs you might find them at a conference"\
        "\nNote: Some conferences offer discounted student pricing or scholarships to make attendance more affordable"\
        "\n<a href=\"https://www.themuse.com/advice/a-conference-junkies-guide-to-attending-and-enjoying-conferences\">A Conference Junkie’s Guide to Attending (and Enjoying) Conferences</a>"\
        "\n<a href=\"https://www.cio.com/article/3344362/your-guide-to-top-tech-conferences-2019.html\">Your guide to top tech conferences 2019</a>"\
        "\n<a href=\"https://medium.com/coder-snorts/a-beginners-guide-to-tech-conferences-76c1ed21d024\">A Beginner’s Guide to Tech Conferences</a>"

    # STEP5: Learn what employer expects
    @step = @user.steps.create(:content=>"Learn what employer expects you to know")
    if @user.goal == "big4"
        @step.extra = "• You must have a solid foundation in data structures and algorithms"\
            "\nYou are expected to be comfortable with recursion, dynamic programming, backtracking, and graphs"\
            "\n• Practice coding on a whiteboard and talking about what you are doing"\
            "\nYour ability to communicate clearly matters probably as much as your ability to actually solve the problem"\
            "\n• For a new grad interview it is unlikely that you will get asked system design questions"
        
    else
        @step.extra = "Unless you are applying to bigger tech companies (Google/Facebook/Microsoft) or unicorns (Airbnb, Pinterest, etc)"\
        "it is unlikely that you will be asked a <a href=\"https://leetcode.com/problems/lru-cache/\">leetcode hard</a> in an interview"\
        "\nIt does mean that there is a wider variety of questions and levels of difficulty you may encounter in an interview"\
        "\n"\
        " OOP, Glassdoor questions, FizzBuzz"
    end
    @step.extra << "Online resources:"\
    "\n- <a href=\"https://www.firecode.io\">Firecode</a> (good for starting out)"\
    "\n- <a href=\"https://leetcode.com\">Leetcode</a>"\    
    "\n- <a href=\"https://www.hackerrank.com\">HackerRank</a>"\
    "\n- <a href=\"https://youtu.be/YJZCUhxNCv8\">'How to Get a Job at the Big 4' by Sean Lee</a>"\
    "\n- <a href=\"https://www.teamblind.com/article/New-Year-Gift---Curated-List-of-Top-100-LeetCode-Questions-to-Save-Your-Time-OaM1orEU\">Curated List of Top 100 LeetCode Questions</a>"\
    "\n- <a href=\"https://jeremyaguilon.me/blog/visualizing_four_key_interview_algorithms\">Visualizing Four Key Technical Interview Algorithms</a>"\
    "\nBooks:"\
    "\n- <a href=\"http://www.crackingthecodinginterview.com/\>Cracking the Coding Interview</a>"\
    "\n- <a href=\"https://elementsofprogramminginterviews.com/\>Elements of Programming Interviews</a>"

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
            @step = @user.steps.create(:content=>"Get an internship first.") # if Junior and too late
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

    # FINALLY:    
    # @step = @user.steps.create(:content=>"If you lack people skills you have to be really good. Get some people skills")
    # @step = @user.steps.create(:content=>"If you apply to 100 places and don't get any callbacks, it's your resume (or where you are applying)")
    # @step = @user.steps.create(:content=>"If you get 10 phone interviews and no in-person invites, do mock interviews. Improve your people skills. Get honest feedback")
    # @step = @user.steps.create(:content=>"If you get in-person interviews and no offers, work on people skills, identify weak points, keep working hard")

  end

  def internSeason # June - Dec
    time = Time.new
    currMonth = time.month
    return currMonth > 5 
  end
end
