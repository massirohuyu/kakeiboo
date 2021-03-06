class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets, comment: '予算テーブル' do |t|
      t.references  :book,    foreign_key: true,  index: true,  null: false,  comment: '会計簿ID'
      t.references  :item,    foreign_key: true,                null: false,  comment: '費目ID'
      t.integer     :amount,                                    null: false,  comment: '金額'
      t.timestamps                                              null: false
    end
  end
end
