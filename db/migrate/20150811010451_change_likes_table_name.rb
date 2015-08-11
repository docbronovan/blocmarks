class ChangeLikesTableName < ActiveRecord::Migration
  def change
    rename_table :likes_tables, :likes
  end
end
