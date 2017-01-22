ActiveAdmin.register Book do

  permit_params :name,
                { :budgets_attributes => [:id, :item_id, :amount] }

  form do |f|
    inputs do
      f.input :name
      inputs 'budgets' do
        f.fields_for :budgets do |budget_f|
          budget_f.input :item_id, as: :hidden
          budget_f.input :amount, label: budget_f.object.item.name
        end
      end
    end
    actions
  end

  controller do
    def new
      @book = Book.new
      @book.set_budgets
    end

    def edit
      resource.set_budgets
    end
  end
end
