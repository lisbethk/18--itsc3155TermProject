module TimelineHelper

  def generate_steps
    # STEP1: Work on personal projects
    @step = @user.steps.create(content: '<h1 id="step1">Step 1: Work on personal projects</h1>')
    if @user.experience == 'hasInternship'
      @step.update_attribute(:extra, '• Having personal projects in addition to work experience will help you showcase your passion for development.'\
      "\nIf your internship was not in the area where you want to find work "\
      '(DevOps instead of Dev, for example) '\
      'you can use personal projects to highlight your interests.')
    elsif @user.experience == 'someExperience'
      @step.update_attribute(:extra, "• Highlight your Hackathon projects/summer research experience on your resume")
    else
      @step.update_attribute(:extra, "• If you do not have any relevant experience "\
      'personal projects will help you present yourself as a software developer.'\
      "\n• Focus on where you want to be and build something relevant to that."\
      "\n• Use your school work as a starting point.")
    end
    @step.extra << "\n• Consider following online project-based courses if you haven't worked on a project yet. "\
        'Try out different courses and platforms to find something that works for you:'\
        "\n<a href=\"https://skillcrush.com/2016/03/15/64-online-resources-to-learn-to-code-for-free/\">Online resources</a>"\
        "\n• Check out other resumes for project ideas:"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 1</a>"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 2</a>"\
        "\n• Make sure you are using the right tools for the job: pick a language or a framework that compliments the problem you are trying to solve."
    @step.update_attribute(:step_id, 1)
    @step.save!

    # STEP2: Network
    @step = @user.steps.create(content: '<h1 id="step2">Step 2: Network</h1>')

    @step.update_attribute(:extra, "\n• Have an online presence. Make sure it is what you want it to be.")
    if @user.standing == 'nonTradidional'
      @step.extra << "\n<a href=\"https://dev.to/jamesmh/how-to-brand-yourself-when-switching-careers-into-software-development-2ajb\">"\
      'How To Brand Yourself When Switching Careers Into Software Development</a>'
    end
    @step.extra << "\n<a href=\"https://medium.freecodecamp.org/building-your-personal-brand-as-a-new-web-developer-f6d4150fd217\">"\
        'How to build your personal brand as a new developer</a>'\
        "\n<a href=\"https://medium.com/@coderacademy/how-to-build-your-personal-brand-as-a-developer-877d7bdf9bdd\">How To Build Your Personal Brand As A Developer</a>"

    @step.extra << "\n• Have an elevator pitch ready."\
        "\nEven if you are willing to \"work for food\", "\
        "even if you don't care if they hire you to do front end or machine learning "\
        'you have to present yourself as someone who knows their value. '\
        "If you don't see any value in yourself "\
        'why would an employer want to invest in you?'\
        "\n• Use Linkedin to find people from your school who work for companies you are interested in. "\
        'Reach out to them to learn more about their experience at the company.'\
        "\n• Go to career fairs and when you do - be prepared."\
        "\n<a href=\"https://www.1takeinterview.com/careerfair/\">How To : Crush Career Fair</a>"\
        "\nCheck universities in your area, they might allow students from other universities to attend as well."\
        "\n• Go to <a href=\"https://www.meetup.com\">tech meetups</a>."\
        "\nMeetups help you become part of your local tech community, build relationships, "\
        "and learn about the latest tech trends."\
        "\n• Use university resources to connect with industry professionals."
    @step.update_attribute(:step_id, 2)
    @step.save!

    # STEP3: Conferences
    @step = @user.steps.create(content: '<h1 id="step3">Step 3: Go to conferences</h1>')
    @step.update_attribute(:extra, "\xE2\x80\xA2 You get to learn new things from people passionate about their field."\
        "\n• You can network with experienced engineers and hiring managers."\
        "\n• If companies you are interested in don't come to your school's career fairs you might find them at conferences."\
        "\n• Some conferences offer discounted student pricing or scholarships to make attendance more affordable."\
        "\n• If you are a woman technologist you should attend <a href=\"https://ghc.anitab.org/\">Grace Hopper Celebration</a> at least once."\
        "\nResources:"\
        "\n<a href=\"https://www.themuse.com/advice/a-conference-junkies-guide-to-attending-and-enjoying-conferences\">"\
        "A Conference Junkie\xE2\x80\x99s Guide to Attending (and Enjoying) Conferences</a>"\
        "\n<a href=\"https://www.cio.com/article/3344362/your-guide-to-top-tech-conferences-2019.html\">Your guide to top tech conferences 2019</a>"\
        "\n<a href=\"https://medium.com/coder-snorts/a-beginners-guide-to-tech-conferences-76c1ed21d024\">A Beginner’s Guide to Tech Conferences</a>")
    @step.update_attribute(:step_id, 3)
    @step.save!

    # STEP4: Write a resume
    @step = @user.steps.create(content: '<h1 id="step4">Step 4: Write a resume</h1>')
    @step.update_attribute(:extra, "\xE2\x80\xA2 A recruiter spends 20 seconds looking over a resume. Make sure your resume is worth a closer look."\
        "\n• Do not ignore formatting and spell checking. "\
        "\nPeople do judge a book by its cover so if your resume looks like you spent a total of 10 minutes on it even the most exciting content might get overlooked."\
        "\n• Use bullet points and action verbs, highlight your achievements "\
        '("saved 42 kittens from a burning building" vs "put out fires").'\
        "\n• Stick to one page.")

    if @user.standing == 'freshman'
      @step.extra << "\n• Remove highshool from your resume if it's still on there."
    elsif @user.standing == 'nonTradidional'
      @step.extra << "\n• Leverage your unique experience but keep the focus on Computer Science"
    end
    @step.extra << "\n• Resume examples: "\
    "\n<a href=\"http://macalinao.github.io/resume/resume.pdf\">#1</a>,"\
    '<a href="http://dierkers.com/docs/Resume.pdf">#2</a>,'\
    '<a href="https://maeganclawges.com/MaeganClawgesResume.pdf">#3</a>,'\
    '<a href="http://macalinao.github.io/resume/resume.pdf">#4</a>'
    @step.update_attribute(:step_id, 4)
    @step.save!

    # "Cover letters: Quantity vs Quality"

    # STEP5: Get resume feedback
    @step = @user.steps.create(content: '<h1 id="step5">Step 5: Get resume feedback</h1>')
    @step.update_attribute(:extra, "• Use your university's career center"\
        "\n• Post your resume on resume advice threads:"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 1</a>"\
        "\n<a href=\"https://www.reddit.com/r/cscareerquestions/search?q=author%3AAutoModerator+Resume+Advice+Thread&restrict_sr=on&sort=new&t=all\">Resume thread 2</a>"\
        "\nNote: If you are applying to 100+ positions and getting no call-backs stop applying and get more feedback")
    @step.update_attribute(:step_id, 5)
    @step.save!

    # STEP6: Learn what employer expects
    @step = @user.steps.create(content: '<h1 id="step6">Step 6: Learn what employers expects you to know</h1>')
    if @user.goal == 'big4'
      @step.update_attribute(:extra, "• You must have a solid foundation in data structures and algorithms."\
          "\n• You are expected to be comfortable with recursion, dynamic programming, backtracking, and graphs."\
          "\n• Practice coding on a whiteboard and talking about what you are doing."\
          "\nYour ability to communicate clearly matters probably as much as your ability to actually solve the problem."\
          "\n• For a new grad interview it is unlikely that you will get asked system design questions."\
          "\n• Learn more:"\
          "\n- <a href=\"https://github.com/CourtneyThurston/microsoft-internships\">Microsoft internships</a>"\
          "\n- <a href=\"https://medium.com/@helen_zhang/the-4-week-plan-to-nailing-your-next-coding-technical-interview-internship-level-c5368c47e1d\">"\
          "The 4 Week Plan to Nailing Your Next Coding & Technical Interview</a>"\
          "\n- <a href=\"https://medium.com/@helen_zhang/breaking-it-down-how-to-approach-any-technical-interview-problem-ce82c052f6a1\">"\
          "Breaking It Down: How to approach any technical interview problem</a>")
      if @user.standing == "freshman"
        @step.extra << "\n- <a href=\"https://medium.com/datadriveninvestor/everything-you-need-to-know-about-interviewing-for-microsoft-explorer-3bf9ff6dc2e\">"\
        "Everything you need to know about interviewing for Microsoft Explorer</a>"
      end
    else
      @step.update_attribute(:extra, '• Unless you are applying to bigger tech companies (Google/Facebook/Microsoft) or unicorns (Airbnb, Pinterest, etc) '\
      'it is unlikely you will ever be asked a <a href="https://leetcode.com/problems/lru-cache/">leetcode hard</a> in an interview.'\
      "\nIt does mean there is a wider variety of questions and levels of difficulty you may encounter in an interview."\
      "\n• Your best bet is to have your fundamentals down - object oriented programming, data structures, and things like networking "\
      'or operating systems depending on the type of jobs you are applying for.'\
      "\n• Be prepared for behavioral questions and make sure you practice your answers before the interview"\
      "\n• Questions like 'Tell me about yourself' or 'Tell me about a time you had to overcome a challenge' "\
      "should not stump you. Practice the "\
      "<a href=\"https://www.vawizard.org/wiz-pdf/STAR_Method_Interviews.pdf\">STAR</a> "\
      "interview response technique to ace that type of questions."\
      "\n• Check Glassdoor to see what kind of questions the companies you are applying for usually ask.")
    end

    @step.extra << "\n• Online resources:"\
      "\n- <a href=\"https://www.firecode.io\">Firecode</a>"\
      "\n- <a href=\"https://www.leetcode.com\">Leetcode</a>"\
      "\n- <a href=\"https://www.hackerrank.com\">HackerRank</a>"\
      "\n- <a href=\"https://www.geeksforgeeks.org\">GeeksforGeeks</a>"\
      "\n- <a href=\"https://github.com/alex/what-happens-when#the-g-key-is-pressed\">What happens when...</a>"\
      "\n- <a href=\"https://youtu.be/YJZCUhxNCv8\">'How to Get a Job at the Big 4' by Sean Lee</a>"\
      "\n- <a href=\"https://www.teamblind.com/article/New-Year-Gift---Curated-List-of-Top-100-LeetCode-Questions-to-Save-Your-Time-OaM1orEU\">Curated List of Top 100 LeetCode Questions</a>"\
      "\n- <a href=\"https://jeremyaguilon.me/blog/visualizing_four_key_interview_algorithms\">Visualizing Four Key Technical Interview Algorithms</a>"\
      "\n• Books:"\
      "\n- <a href=\"https://elementsofprogramminginterviews.com\">Elements of Programming Interviews</a>"\
      "\n- <a href=\"https://www.crackingthecodinginterview.com\">Cracking the Coding Interview</a>"
    @step.update_attribute(:step_id, 6)
    @step.save!

    # STEP7: Apply for a job
    @step = @user.steps.create(content: '<h1 id="step7">Step 7: Apply</h1>')
    if @user.goal == 'internship'
      @step.update_attribute(:extra, '• Many big companies start their recruiting season in August and finish it by December. '\
        "Even with the most amazing resume if you apply late at best you get an interview spot the following year."\
        "• Sometimes it is easier to get a coding challenge or a phone screen from a big company "\
        "so consider applying even if you don't think you have enough experience.")
        if @user.experience == "hasInternship"
          @step.extra << "\n• Internships is the best time to explore your interests and try out different things. "\
          "So even if you loved a company you interned at seriously consider applying to other places. "\
          "If you worked for a corporation try out start up life for a summer or vice versa. "\
          "Having diverse experience will help you make an informed decision when it comes to accepting a full-time offer."\
        else
          @step.extra << "\n• Focus on local companies and especially companies that come to your school to recruit. "\
          "It is much easier to get where you want to be once you have experience, "\
          "so seek out every opportunity you can. It will help you in the long run."
        end
        @step.extra << "\n- <a href=\"https://www.intern.supply/\">Intern.Supply</a>"
          
      if !intern_season
        @step.extra << '• Even though you are late in the hiring season it is worth seeing if anyone is hiring.'\
          "\n• Contact your professors to see if there are any summer research opportunities available."\
          "\n• Find a summer project that you could focus on if you don't find anything."\
          "\n• Consider applying for Fall or Spring internships. "\
          "You'll have to take a semester off school but the experience could be worth it."
      end
    
    elsif @user.goal == 'localJob'      
        @step.update_attribute(:extra, '• Apply for local jobs')
      
    elsif @user.goal == 'big4'
      if @user.standing == 'Senior' || @user.standing == 'NonTradidional'
        @step.update_attribute(:extra, '• Apply for new grad roles')
      else
        @step.update_attribute(:extra, '• The easiest path to a full-time role at a big tech company is an intern conversion.')
      end
      @step.extra << "\n• Watch <a href=\"https://youtu.be/YJZCUhxNCv8\">'How to Get a Job at the Big 4' by Sean Lee</a> "\
        "to learn more about getting a job at the Big 4."   
    end

    @step.extra << "\n• Cold applying with always have a lower response rate, "\
      "doesn't matter if you are applying to Google or a local startup. "\
      "So your main focus should be on building connections "\
      "(via meetups, conferences or an active online presence) "\
      "and utilizing your university's career center."      
    @step.update_attribute(:step_id, 7)
    @step.save!

    @step = @user.steps.create(:content=>'<h1 id="step8">Bonus: Salary negotiation resources</h1>')
    @step.update_attribute(:extra, "\n- <a href=\"https://medium.com/@helen_zhang/how-i-got-an-extra-35-000-by-negotiating-my-first-job-offer-beeb0620c616\">"\
      "How I got an extra $35,000 by negotiating my first job offer</a>"\
      "\n- <a href=\"https://www.levels.fyi\">Levels.fyi</a>"\
      "\n- <a href=\"https://blog.usejournal.com/i-interviewed-at-six-top-companies-in-silicon-valley-in-six-days-and-stumbled-into-six-job-offers-fe9cc7bbc996\">"\
      "I interviewed at six top companies in Silicon Valley in six days, and stumbled into six job offers</a>"\
      "\n- <a href=\"https://blog.usejournal.com/how-i-negotiated-a-software-engineer-offer-in-silicon-valley-"\
      "f11590f5c656?fbclid=IwAR3ZxSC446r6XOeg868-Bi0fzE5KfNLVyhy8Yri5oqwqNfphrCxKaOnqvqU\">"\
      "How I negotiated a $300,000 job offer in Silicon Valley</a>")
      @step.update_attribute(:step_id, 8)
    @step.save!
    # @step = @user.steps.create(:content=>"If you lack people skills you have to be really good. Get some people skills")
    # @step = @user.steps.create(:content=>"If you apply to 100 places and don't get any callbacks, it's your resume (or where you are applying)")
    # @step = @user.steps.create(:content=>"If you get 10 phone interviews and no in-person invites, do mock interviews. Improve your people skills. Get honest feedback")
    # @step = @user.steps.create(:content=>"If you get in-person interviews and no offers, work on people skills, identify weak points, keep working hard")
  end

  def intern_season
    time = Time.new
    time.month > 4
  end
end
