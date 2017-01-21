class CreateOwnerships < ActiveRecord::Migration[5.0]
  def change
    create_table :ownerships, comment: '所有者テーブル' do |t|
      t.string    :name,                                  null: false,  comment: '所有者名'
    end
  end
end
