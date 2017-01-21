class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries , comment: '収支テーブル' do |t|
      t.date        :action_date,                     null: false,  comment: 'アクション日'
      t.references  :item,        foreign_key: true,  null: false,  comment: '費目'
      t.references  :detail,      foreign_key: true,  null: false,  comment: '内訳'
      t.integer     :amount,                          null: false,  comment: '金額'
      t.text        :description,                                   comment: 'コメント'
      t.integer     :input_user_id,                   null: false,  comment: '入力者'
      t.references  :ownership,   foreign_key: true,  null: false,  comment: '所有者'

      t.timestamps                                        null: false

    end
    add_foreign_key :entries, :users, column: :input_user_id
  end
end
