class CreateLikesTable < ActiveRecord::Migration
  def change
    create_table :likes_tables, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :bookmark, index: true, foreign_key: true
    end
  end
end
