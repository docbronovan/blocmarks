class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :urlname
      t.references :topic, index: true
      t.timestamps null: false
    end
  end
end
