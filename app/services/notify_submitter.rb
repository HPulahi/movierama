# Cast or withdraw a vote on a movie
class NotifySubmitter
  def initialize(user, movie)
    @user  = user
    @movie = movie
  end

  def notify_me
    @movie.update(notify: true)
  end

  def unnotify_me
    @movie.update(notify: false)
  end
end
