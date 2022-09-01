# To deliver this notification:
#
# PcommentNotification.with(post: @post).deliver_later(current_user)
# PcommentNotification.with(post: @post).deliver(current_user)

class PcommentNotification < Noticed::Base
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  # param :post

  # Define helper methods to make rendering easier.
  #
  def message
    @poster = Poster.find(params[:pcomment][:poster_id])
    @pcomment = Pcomment.find(params[:pcomment][:id])
    @user = User.find(@pcomment.user_id)
    "#{@user.username} commented on #{@poster.title.truncate(10)}"
  end

  def url
    poster_path(Poster.find(params[:pcomment][:poster_id]))
  end
end
