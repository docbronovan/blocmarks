class ChangeUrlTableName < ActiveRecord::Migration
  def change
    rename_table :urls, :bookmarks
    rename_column :bookmarks, :urlname, :url
    rename_column :topics, :name, :title
  end
end
