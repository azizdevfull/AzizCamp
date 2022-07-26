class ModeratorController < ApplicationController
  def index
  end

  def projects
  end

  def attachers
  end

  def tasks
  end

  def posters
    @posters = Poster.all.includes(:user, :pcomments)
  end

  def pcomments
  end

  def users
    @users = User.all
  end

  # def edit
  #   @user = User.find(params[:user_id])
  # end


  # def update
  #   @user = User.find(params[:user_id])
  #   if @user.update(user_params)
  #     redirect_to moderator_path
  #   else
  #     render 'edit'
  #   end

  def project
  end

  def show_poster
    @poster = Poster.includes(:user, :pcomments).find(params[:id])
  end
end
