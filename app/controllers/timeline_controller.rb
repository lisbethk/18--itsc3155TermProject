class TimelineController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    if !@user.steps.present?
        generate_steps()
    end
  end

  def generate_steps
    # STEP1: Work on personal projects
    @step = @user.steps.create(:content=>"Step 1: Work on personal projects")
    if @user.experience == "hasInternship"
        @step.extra = "Having personal projects in addition to work experience will help you showcase your passion for development."
        "\nIf your internship was not in the area where you want to find work "\
        "(DevOps instead of Dev, for example) "\
        "you can use personal projects to highlight your interests."
    elsif @user.experience == "hackathons"
        @step.extra = "• Highlight your Hackathon projects/summer research experience on your resume"
    else
        @step.extra = "• If you do not have any relevant experience "\
        "personal projects will help you present yourself as a software developer."\
        "\n• Focus on where you want to be and build something relevant to that "\
        "\n• Use your school work as a starting point."
    end
    @step.extra << "\n• Consider following online project-based courses if you haven't worked on a project yet. "\
        "Try out different courses and platforms to find something that works for you:"\
        "\n<a href=\"https://skillcrush.com/2016/03/15/64-online-resources-to-learn-to-code-for-free/\">Online resources</a>"\
        "\n• Check out other resumes for project ideas:"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 1</a>"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 2</a>"\
        "\n• Make sure you are using the right tools for the job: pick a language or a framework that compliments the problem you are trying to solve."


    # STEP2: Network
    @step = @user.steps.create(:content=>"Step 2: Network")

    @step.extra ="\n• Have an online presence. Make sure it is what you want it to be."
    if @user.standing == "nonTradidional"
        @step.extra << "\n<a href=\"https://dev.to/jamesmh/how-to-brand-yourself-when-switching-careers-into-software-development-2ajb\">"\
        "How To Brand Yourself When Switching Careers Into Software Development</a>"
    end
    @step.extra << "\n<a href=\"https://medium.freecodecamp.org/building-your-personal-brand-as-a-new-web-developer-f6d4150fd217\">"\
        "How to build your personal brand as a new developer</a>"\
        "\n<a href=\"https://medium.com/@coderacademy/how-to-build-your-personal-brand-as-a-developer-877d7bdf9bdd\">How To Build Your Personal Brand As A Developer</a>"
    
    @step.extra << "\n• Have an elevator pitch ready."\
        "\nEven if you are willing to \"work for food\", even if you don't care if they hire you to do front end or machine learning "\
        "you have to present yourself as someone who knows their value. If you don't see any value in yourself and your potential "\
        "why would an employer invest in you?"\
        "\n• Use Linkedin to find people from your school who work for companies you are interested in. "\
        "Reach out to them to learn more about their experience at the company."\
        "\n• Go to career fairs and when you do - come prepared."\
        "\n<a href=\"https://www.1takeinterview.com/careerfair/\">How To : Crush Career Fair</a>"
        "\nCheck universities in your area, they might allow students from other universities to attend as well."\
        "\n• Go to <a href=\"https://www.meetup.com\">tech meetups</a>."\
        "\nMeetups help you become part of your local tech community, build relationships, and get exposure to new things."\
        "\n• Use university resources to connect with industry professionals."

    # STEP3: Conferences
    @step = @user.steps.create(:content=>"Step 3: Go to conferences")
    @step.extra = "• You get to learn new things from people passionate about their field."\
        "\n• You can network with engineers and hiring managers."\
        "\n• If companies you are interested in don't come to your school's career fairs you might find them at a conference."\
        "\n• Some conferences offer discounted student pricing or scholarships to make attendance more affordable."\
        "\n• If you are a woman technologist you have to attend <a href=\"https://ghc.anitab.org/\">Grace Hopper Celebration</a> at least once."\
        "\n<a href=\"https://www.themuse.com/advice/a-conference-junkies-guide-to-attending-and-enjoying-conferences\">"\
        "A Conference Junkie’s Guide to Attending (and Enjoying) Conferences</a>"\
        "\n<a href=\"https://www.cio.com/article/3344362/your-guide-to-top-tech-conferences-2019.html\">Your guide to top tech conferences 2019</a>"\
        "\n<a href=\"https://medium.com/coder-snorts/a-beginners-guide-to-tech-conferences-76c1ed21d024\">A Beginner’s Guide to Tech Conferences</a>"


    # STEP4: Write a resume
    @step = @user.steps.create(:content=>"Step 4: Write a resume")
    @step.extra = "• A recruiter spends 20 seconds looking over a resume. Make sure your resume is worth a closer look."\
        "\n• Do not ignore formatting and spell checking. "\
        "\nPeople do judge a book by its cover so if your resume looks like you spent a total of 10 minutes on it even the most exciting content might get overlooked."\
        "\n• Use bullet points and action verbs, highlight your achievements "\
        "(\"saved 42 kittens from a burning building\" vs \"put out fires\")."\
        "\n• Stick to one page."        

    if @user.standing == "freshman"
        @step.extra << "\n• Remove highshool from your resume"
    elsif @user.standing == "nonTradidional"
        @step.extra << "\n• Leverage your unique experience but keep the focus on Computer Science"
    end
    @step.extra << "\n• Examples: <a href=\"http://macalinao.github.io/resume/resume.pdf\">#1</a>,"\
    "<a href=\"http://dierkers.com/docs/Resume.pdf\">#2</a>,"\
    "<a href=\"https://maeganclawges.com/MaeganClawgesResume.pdf\">#3</a>,"\
    "<a href=\"http://macalinao.github.io/resume/resume.pdf\">#4</a>"

    #"Cover letters: Quantity vs Quality - it's up to you really"

    @step = @user.steps.create(:content=>"Step 5: Get resume feedback")
    @step.extra = "• Use your university's career center"\
        "\n• If working with a third-party recruiter, ask them for feedback"\
        "\n• Post your resume on resume advice threads:"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 1</a>"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 2</a>"\
        "\nNote: If you are applying to 100+ positions and getting no call-backs stop and get more feedback"

    # STEP6: Learn what employer expects
    @step = @user.steps.create(:content=>"Step 6: Learn what employers expects you to know")
    if @user.goal == "Google"
        @step.extra = "• You must have a solid foundation in data structures and algorithms."\
            "\nYou are expected to be comfortable with recursion, dynamic programming, backtracking, and graphs."\
            "\n• Practice coding on a whiteboard and talking about what you are doing."\
            "\nYour ability to communicate clearly matters probably as much as your ability to actually solve the problem."\
            "\n• For a new grad interview it is unlikely that you will get asked system design questions."        
    else
        @step.extra = "Unless you are applying to bigger tech companies (Google/Facebook/Microsoft) or unicorns (Airbnb, Pinterest, etc) "\
        "it is unlikely that you will be asked a <a href=\"https://leetcode.com/problems/lru-cache/\">leetcode hard</a> in an interview."\
        "\nIt does mean that there is a wider variety of questions and levels of difficulty you may encounter in an interview."\
        "\nYour best bet is to have your fundamentals down - object oriented programming, data structures, and things like networking "\
        "or operating systems depending on the type of jobs you are applying for."\
        "\nCheck Glassdoor to see what type of questions the companies you are applying for usually ask."
    end
    
    @step.extra << "\nOnline resources:"\
    "\n- <a href=\"https://www.firecode.io\">Firecode</a>"\
    "\n- <a href=\"https://www.leetcode.com\">Leetcode</a>"\
    "\n- <a href=\"https://www.hackerrank.com\">HackerRank</a>"\
    "\n- <a href=\"https://www.geeksforgeeks.org\">GeeksforGeeks</a>"\
    "\n- <a href=\"https://github.com/alex/what-happens-when#the-g-key-is-pressed\">What happens when...</a>"\
    "\n- <a href=\"https://youtu.be/YJZCUhxNCv8\">'How to Get a Job at the Big 4' by Sean Lee</a>"\
    "\n- <a href=\"https://www.teamblind.com/article/New-Year-Gift---Curated-List-of-Top-100-LeetCode-Questions-to-Save-Your-Time-OaM1orEU\">Curated List of Top 100 LeetCode Questions</a>"\
    "\n- <a href=\"https://jeremyaguilon.me/blog/visualizing_four_key_interview_algorithms\">Visualizing Four Key Technical Interview Algorithms</a>"\
    "\nBooks:"\
    "\n- <a href=\"https://elementsofprogramminginterviews.com\">Elements of Programming Interviews</a>"\
    "\n- <a href=\"https://www.crackingthecodinginterview.com\">Cracking the Coding Interview</a>"

    # STEP7: Apply for a job
    @step = @user.steps.create(:content=>"Step 7: Apply")
    if @user.goal == "Internship"
        if internSeason
            @step.extra = "Apply for internships"
        else
            @step.extra = "Focus on summer research; apply for local internships; look into summer projects; consider Fall/Winter/CoOps"
        end
    elsif @user.goal == "LocalJob"
        if @user.standing == "Junior" && internSeason
            @step.extra = "Apply for internships"
        else
            @step.extra = "Apply for local jobs"
        end
    elsif @user.goal == "Google"
        if @user.standing == "Senior" || @user.standing == "NonTradidional"
            @step.extra = "Apply for new grad roles"
        else
            @step.extra = "The easiest path to a full-time role at a big tech company is an intern conversion"
        end
    else
        @step.extra = "Apply for jobs"
    end

    @step.extra << "\nCold applying with always have a lower response rate, doesn't matter if you are applying to Google or a local startup."\
        "\nYour main focus should be on building connections (via meetups, conferences or an active online presence) and utilizing your university's career center."

    # FINALLY:    
    # @step = @user.steps.create(:content=>"If you lack people skills you have to be really good. Get some people skills")
    # @step = @user.steps.create(:content=>"If you apply to 100 places and don't get any callbacks, it's your resume (or where you are applying)")
    # @step = @user.steps.create(:content=>"If you get 10 phone interviews and no in-person invites, do mock interviews. Improve your people skills. Get honest feedback")
    # @step = @user.steps.create(:content=>"If you get in-person interviews and no offers, work on people skills, identify weak points, keep working hard")

    @step = @user.steps.create(:content=>"FAQ")
    @step.extra = "- Why doesn't this guide cover IT/cyber security/data science jobs?"\
        "\n()"\
        "\n- I don't know how to build a project/find a conference/pick a framework/etc"\
        "\nAlways start by googling your question. Odds are someone else had the same issue and you'll find plenty of resources to help you figure things out."\
        "\n- I think this guide is wrong, how can I let you know?"\
        "\n<a href=\"\">Contact Us</a>"
  end

  def internSeason # June - Dec
    time = Time.new
    currMonth = time.month
    return currMonth > 5 
  end
end
