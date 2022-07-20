ActiveAdmin.register User do
  permit_params :username, :email, :password, :password_confirmation, :project_id, :role
  # This determines which attributes of the User model will be displayed in the index page. I have left only username, but feel free to uncomment the rest of the lines or add any other of the User attributes.
  index do
   selectable_column
   id_column
   column :username
   column :email
   column :role
   column :current_sign_in_at
   column :sign_in_count
   column :created_at
   actions
 end
 
 index do
   column :username
   column :email
   column :role
   column :current_sign_in_at
   column :sign_in_count
   column :created_at
   actions
 end
 
 # Default is :email, but we need to replace this with :username
 filter :username
 filter :email
 filter :role
 filter :current_sign_in_at
 filter :sign_in_count
 filter :created_at
 
 # This is the form for creating a new user using the Admin backend. If you have added additional attributes to the User model, you need to include them here.
 form do |f|
   f.inputs "User Details" do
    f.input :username 
    f.input :email
    f.input :role
     f.input :password
     f.input :password_confirmation
   end
   f.actions
 end
 
 # This is related to Rails 4 and the changes it introduced in handling strong parameters. Here we replace :email with :username.
 controller do
   def permitted_params
     params.permit user: [:username, :email, :password, :password_confirmation, :role]
   end
 end
end
