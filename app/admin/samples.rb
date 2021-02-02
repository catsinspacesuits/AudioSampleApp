ActiveAdmin.register Sample do
  permit_params :title, :description, :file_type, :audio_data, :channels, :sample_rate, :file_size, tag_ids: [], category_ids: []

  index do
  selectable_column
  id_column
  column :title
  column :description
  column :categories do |sample|
    table_for sample.categories.order('name ASC') do
      column do |category|
        category.name
      end
     end
  end
  column :tag_list
    
end

show do
  attributes_table do
    row :title
    row :description
    table_for sample.categories.order('name ASC') do
      column "Categories" do |category|
        link_to category.name, [ :admin, category ]
      end
    end
  end
end

form do |f|
  f.inputs "Add/Edit Sample" do
    f.input :title
    f.input :description
    f.input :categories, as: :select
    f.input :tag_list, 
  :collection => ActsAsTaggableOn::Tag.all.map(&:name)
  end
  actions
end
end
