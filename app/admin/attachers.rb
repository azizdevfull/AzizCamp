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

  index do
    column :project
    column :name
    column :upload do |ad|
      if ad.upload.image?
      link_to image_tag(ad.upload,size: "50x50"), rails_blob_path(ad.upload, disposition: "attachment")    
    else
      link_to ad.upload.filename,  rails_blob_path(ad.upload, disposition: "attachment")
    end
    end
    column do |attacher|
      links = link_to "Show", admin_attacher_path(attacher)
      links
      links += link_to "Edit", edit_admin_attacher_path(attacher)
      links += " "
      links += link_to "Delete", admin_attacher_path(attacher), :method => :delete, data: { confirm: "Are you sure?" }
      links
    end
  end

  show do
    attributes_table do
      row :project
      row :name
      row :upload do |ad|
        if ad.upload.image?
        link_to image_tag(ad.upload,size: "150x150"), rails_blob_path(ad.upload, disposition: "attachment")    
        else
      link_to ad.upload.filename,  rails_blob_path(ad.upload, disposition: "attachment")
      end
    end
  end
  end

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
