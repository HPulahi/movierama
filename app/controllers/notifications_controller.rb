class NotificationsController < ApplicationController
  def create
    authorize! :notify, _movie

    _notifier.notify_me
    redirect_to root_path, notice: 'You will now be notified'
  end
  
  def destroy
    authorize! :notify, _movie

    _notifier.unnotify_me
    redirect_to root_path, notice: 'You will no longer be notified'
  end

  private

  def _notifier
    NotifySubmitter.new(current_user, _movie)
  end

  def _movie
    @_movie ||= Movie[params[:movie_id]]
  end
  
end