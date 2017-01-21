ActiveAdmin.register Entry do

  permit_params :action_date,
                :item_id,
                :detail_id,
                :amount,
                :description,
                :input_user_id,
                :ownership_id

  form do |f|
    inputs do
      f.input :ownership
      f.input :action_date, as: :date_time_picker, datepicker_options: { timepicker: false }
      f.input :item
      f.input :detail
      f.input :amount
      f.input :description
      f.input :input_user
    end
    actions
  end

  controller do
    # def create
    #   byebug
    # end
  end
end
