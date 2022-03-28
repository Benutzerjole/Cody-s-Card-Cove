ActiveAdmin.register AboutInfo do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :description, :phone_number, :email, :twitter, :facebook, :instagram

  menu label: "About Info", priority: 2
  #
  # or
  #
  # permit_params do
  #   permitted = [:description, :phone_number, :email, :twitter, :facebook, :instagram]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
