class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def vote_received(user, movie)
    mail(to: user.email, subject: "Your  movie #{movie} has just received a new vote")
  end
end
