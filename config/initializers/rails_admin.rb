  require 'rails_admin/config/fields/base'
  RailsAdmin.config do |config|
  config.asset_source = :sprockets

  config.main_app_name = Proc.new {
    ["Basecamp"]
  }
  config.authenticate_with do
    redirect_to main_app.root_path unless warden.user.admin?
    end
  ### Popular gems integration

  config.model Attacher do
    list do
      field :id
      field :name
      field :created_at
      field :updated_at
      field :upload do
        formatted_value do
          bindings[:view].tag(:img, { :src => bindings[:object].image.url(:thumb)}) 
        end
      end
    end
  end

  config.model Poster do
    list do
      field :id
      field :title
      field :body
      field :image
      field :created_at
      field :updated_at
      field :views
      field :user_name
      field :pcomments
    end

    show do
      field :title
      field :body
      field :image
      field :views
      field :user_name
      field :pcomments
    end

    create do
      field :title
      field :body
      field :image
      field :views
      field :user_id, :enum do
        enum do
          User.all.collect {|p| [p.username, p.id]}
      end
      
  end
      field :pcomments
    end

    edit do
      field :title
      field :image
      field :body
      field :views
      field :user_id, :enum do
        enum do
          User.all.collect {|p| [p.username, p.id]}
      end
      
      end
      
      field :pcomments
    end
   

  end

  config.model Project do
    list do
      field :id
      field :user_name
      field :name
      field :description
      field :slug
      field :created_at
      field :updated_at

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
      create do
        field :name
        field :description
        field :user_id, :enum do
          enum do
            User.all.collect {|p| [p.username, p.id]}
        end
        
        end
        field :attacher
        field :tasks do
          pretty_value do
            bindings[:object].tasks.all.map {|v| v.description}.join(', ')
            end
            end

      end

      edit do
        field :name
        field :description
        field :slug
        field :user_id, :enum do
          enum do
            User.all.collect {|p| [p.username, p.id]}
            end
      end
        field :attacher
        field :tasks do
          pretty_value do
            builds[:object].tasks.all.map {|v| v.description}.join(', ')
          end
        end

  end
end

  
module RailsAdmin
  module Config
    module Fields
      module Types
        class Datetime < RailsAdmin::Config::Fields::Base
          def value
            value_in_default_time_zone = bindings[:object].send(name)
            return nil if value_in_default_time_zone.nil?
            pacific_time_zone = ActiveSupport::TimeZone.new('Uzbekistan/Tashkent')
            value_in_default_time_zone.in_time_zone(pacific_time_zone)
          end
          end
        end
      end
    end
  end


  config.model Pcomment do
    configure :user, :belongs_to_association
    list do
      field :id
      field :name
      field :created_at, :datetime
      field :updated_at, :datetime
      field :user_name
      field :poster
    end
    show do
      field :name
      field :user_name
      field :poster
    end

    create do
      field :name
      field :poster
      field :user_id, :enum do
        enum do
          User.all.collect {|p| [p.username, p.id]}
      end
  end

end
end
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
  def user_uname
    try(:username)
  end
  
    def user_name
      self.user.username

  end

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
