class CreateUserOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_ownerships, comment: '利用者が閲覧可能な所有者テーブル' do |t|
      t.references  :user,      foreign_key: true,  index: true,  null: false,  comment: '利用者'
      t.references  :ownership, foreign_key: true,                null: false,  comment: '所有者'
      t.timestamps                                                null: false
    end
  end
end
