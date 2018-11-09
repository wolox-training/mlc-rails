ActiveAdmin.register Rent do
  permit_params :user_id, :book_id, :start_date, :end_date
  index do
    selectable_column
    id_column
    column :user
    column :book
    column :start_date
    column :end_date
    column :created_at
    column :updated_at
    actions
  end

  filter :user
  filter :book
  filter :start_date
  filter :end_date

  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :book
      f.input :start_date
      f.input :end_date
    end
    f.actions
  end
end
