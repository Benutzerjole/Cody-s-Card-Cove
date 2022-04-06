ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :base_price, :sale_price, :quantity_in_stock, :category_id, :image

  menu priority: 2

  form do |f|
    f.semantic_errors
    f.inputs
    f.inputs do
      f.input :image, as: :file, hint: f.object.image.present? ? image_tag(f.object.image) : ""
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :category_id
      row :description
      row :base_price
      row :sale_price
      row :image do |ad|
        ad.image.present? ? image_tag(ad.image) : ""
      end
    end
    active_admin_comments
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :base_price, :sale_price, :quantity_in_stock, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
