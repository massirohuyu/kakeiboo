class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, comment: '費目テーブル' do |t|
      t.string    :name,  null: false,             comment: '費目名'
      t.integer   :kind,  null: false, default: 0, comment: '収支'
      t.timestamps        null: false
    end
  end
end
