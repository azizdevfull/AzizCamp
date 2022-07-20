ActiveAdmin.register Attacher do
  # belongs_to :project
  permit_params :name, :upload, :project_id
  # permit_params :name, :attachment, :upload, :project_id
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :attachment, :project_id
  #
  # or
  
  form do |f|
    f.semantic_errors 
    f.inputs
    f.inputs do
      f.input :upload, as: :file
    end
    f.actions
  end

  # permit_params do
  #   permitted = [:name, :attachment, :project_id]
  #   permitted << :other if params[:action] == 'create'
  #   permitted
  # end
  
end
