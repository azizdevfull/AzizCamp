RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.main_app_name = Proc.new {
    ["Basecamp"]
  }
  config.authenticate_with do
    redirect_to main_app.root_path unless warden.user.admin?
    end
  ### Popular gems integration

  config.model Project do
    list do
      field :id
      field :name
      field :description
      field :created_at
      field :updated_at
      field :user_name
      field :attacher
      field :tasks do
        pretty_value do
          bindings[:object].tasks.map(&:description).join(", ")
          end
        end

    end
    show do
      field :name
      field :description
      field :user_name
      field :attacher
      field :tasks do
        pretty_value do
          bindings[:object].tasks.all.map {|v| v.description}.join(', ')
          end
        end
      end

  end

  def user_name
    self.user.username
  end

  # def tasks_description
  #   self.tasks.description
  # end
  

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
