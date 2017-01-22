ActiveAdmin.register User do
  menu priority: 1

  permit_params :uid,
                :name,
                :password,
                :password_confirmation,
                { :book_ids => [] }

  form do |f|
    inputs do
      f.input :uid
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :books, as: :select2_multiple
    end
    actions
  end
end
