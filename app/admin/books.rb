ActiveAdmin.register Book do
  permit_params :genre, :author, :cover_image, :title, :publisher, :year

  index do
    selectable_column
    id_column
    column :genre
    column :author
    column :cover_image
    column :title
    column :publisher
    column :year
    column :created_at
    column :updated_at
    actions
  end

  filter :genre
  filter :author
  filter :cover_image
  filter :title
  filter :publisher
  filter :year

  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :genre
      f.input :author
      f.input :cover_image
      f.input :title
      f.input :publisher
      f.input :year
    end
    f.actions
  end
end
