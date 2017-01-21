class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets, comment: '予算テーブル' do |t|
      t.references  :ownership, foreign_key: true,  index: true,  null: false,  comment: '所有者'
      t.references  :item,      foreign_key: true,                null: false,  comment: '費目'
      t.integer     :amount,                                      null: false,  comment: '金額'
      t.timestamps                                                null: false
    end
  end
end
