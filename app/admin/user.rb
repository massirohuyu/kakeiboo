ActiveAdmin.register User do
  menu priority: 1

  permit_params :uid,
                :name,
                :password,
                :password_confirmation,
                { :ownership_ids => [] }

  form do |f|
    inputs do
      f.input :uid
      f.input :name
      f.input :password
      f.input :password_confirmation
      f.input :ownerships, as: :select2_multiple
    end
    actions
  end
end
