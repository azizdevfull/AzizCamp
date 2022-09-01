class Pcomment < ApplicationRecord
  belongs_to :poster
  belongs_to :user

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Notification'

  private

  def notify_recipient
    PcommentNotification.with(pcomment: self, poster: poster).deliver_later(poster.user)
  end

  def cleanup_notifications
    notifications_as_comment.destroy_all
  end
end
