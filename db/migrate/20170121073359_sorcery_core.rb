class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    create_table :users, comment: '利用者テーブル' do |t|
      t.string :uid,              null: false,  comment: 'ログインID'
      t.string :name,             null: false,  comment: '名前'
      t.string :crypted_password,               comment: 'パスワード'
      t.string :salt,                           comment: 'ソルト'

      t.timestamps                null: false
    end

    add_index :users, :uid, unique: true
  end
end
