ActiveAdmin.register User do

  permit_params :uid,
                :name,
                :password,
                :password_confirmation

  form do |f|
    inputs do
      f.input :uid
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    actions
  end

end
