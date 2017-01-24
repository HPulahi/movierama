# Notify a submitter of a new vote
class NotifySubmitter
  def initialize(user, movie)
    @user  = user
    @movie = movie
  end

  def notify_me
    @movie.update(deliver_notification: true)
  end

  def unnotify_me
    @movie.update(deliver_notification: false)
  end
  
  def send_notification_to_submitter
    UserMailer.vote_received(@user, @movie).deliver
  end
end