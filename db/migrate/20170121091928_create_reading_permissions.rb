class CreateReadingPermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_permissions, comment: '利用者が閲覧可能な会計簿テーブル' do |t|
      t.references  :user,  foreign_key: true,  index: true,  null: false,  comment: '利用者ID'
      t.references  :book,  foreign_key: true,                null: false,  comment: '会計簿ID'
      t.timestamps                                            null: false
    end
  end
end
