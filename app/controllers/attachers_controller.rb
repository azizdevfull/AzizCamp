class AttachersController < InheritedResources::Base
  before_action :set_project
  before_action :set_attacher, only: [:show, :edit, :update, :destroy]


  # GET projects/1/tasks
  def index
    @attachers = @project.attacher

  end

  # GET projects/1/tasks/1
  def show
      
  end

  # GET projects/1/tasks/new
  def new
    @attacher = @project.attacher.build
    @attachers = @project.attacher
  end

  # GET projects/1/tasks/1/edit
  def edit
  end

  # POST projects/1/tasks
  def create
    @attacher = @project.attacher.build(attacher_params)

    if @attacher.save
      redirect_to new_project_attacher_path
    else
      render action: 'new'
    end
  end

  # PUT projects/1/tasks/1
  def update
    if @attacher.update(attacher_params)
      redirect_to(@attacher.project)
    else
      render action: 'edit'
    end
  end

  # DELETE projects/1/tasks/1
  def destroy
    @attacher.destroy
    redirect_to root_path
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = current_user.projects.friendly.find(params[:project_id])
    end

    def set_attacher
      @attacher = @project.attacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attacher_params
      params.require(:attacher).permit(:name, :attachment, :upload)
    end

end
