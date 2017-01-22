class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books, comment: '会計簿' do |t|
      t.string    :name,                                  null: false,  comment: '会計簿名'
    end
  end
end
