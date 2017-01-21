class CreateDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :details, comment: '内訳テーブル' do |t|
      t.string     :name,                                   null: false,  comment: '内訳名'
      t.references :item,  index: true, foreign_key: true,  null: false,  comment: '所属費目'
      t.timestamps                                          null: false
    end
  end
end
