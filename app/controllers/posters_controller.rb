class PostersController < InheritedResources::Base
  before_action :set_poster, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[show index]
  # GET /posts or /posts.json
  def index
    @posters = Poster.all.includes(:user).order(created_at: :desc)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @poster.update(views: @poster.views + 1)
    # @comments = @poster.comments.order(created_at: :desc)
    @pcomments = @poster.pcomments.order(created_at: :desc)
   end
    
    # @comments = @post.comments.includes(:user, :rich_text_body).order(created_at: :desc)

    # ahoy.track 'Viewed Post', post_id: @post.id

    # mark_notifications_as_read
  

  # GET /posts/new
  def new
    @poster = Poster.new
    @users = User.all
  end

  # GET /posts/1/edit
  def edit
    @users = User.all
  end

  # POST /posts or /posts.json
  def create
    @poster = Poster.new(poster_params)
    # @poster.user = current_user

    respond_to do |format|
      if @poster.save
        format.html { redirect_to poster_url(@poster), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @poster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @poster.update(poster_params)
        format.html { redirect_to poster_url(@poster), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @poster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @poster.destroy
    respond_to do |format|
      format.html { redirect_to posters_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  def set_poster
    @poster = Poster.find(params[:id])

    # If an old id or a numeric id was used to find the record, then
    # the request slug will not match the current slug, and we should do
    # a 301 redirect to the new path
    # redirect_to @post, status: :moved_permanently if params[:id] != @poster.slug
  end

    def poster_params
      params.require(:poster).permit(:title, :body, :user_id, :image)
    end

end
