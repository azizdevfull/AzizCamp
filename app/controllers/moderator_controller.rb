class ModeratorController < ApplicationController
  before_action :set_product_category
  # before_action :poster_params

  def index
  end

  def projects
    @projects = Project.all.includes(:user, :attacher)
  end

  def attachers
    @projects = Project.all.includes(:user)
  end

  def tasks
  end

  def posters
    @posters = Poster.all.includes(:user, :pcomments )
    @pcomments = Pcomment.all
  end

  def new_poster
    @poster = Poster.new(params.permit(:title, :body, :user))
  end

  # def creat
  #   @poster = Poster.new(poster_params)
  #   @poster.user = current_user
  #   # @poster.user = current_user

  #   respond_to do |format|
  #     if @poster.save
  #       format.html { redirect_to poster_url(@poster), notice: 'Post was successfully created.' }
  #       format.json { render :show, status: :created, location: @poster }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @poster.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def pcomments
    @pcomments = Pcomment.all.includes(:user, :poster)
  end

  def users
    @users = User.all.includes(:projects, :posters)
    # @user = User.find(params[:uid])
    # @projects = @user.projects
     # @project = @users.projects.find(params[:project_id])
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

  def show_pcomment
    @pcomment = Pcomment.includes(:user, :poster).find(params[:id])
  end


  private

  
  def set_product_category
    @users = User.all.order(:username)
    @attachers = Attacher.all.order(:name)
    
  end

  def poster_params
    params.require(:poster).permit(:title, :body, :user_id)
    # params.permit(:title, :body, :user_id)
  end
end
