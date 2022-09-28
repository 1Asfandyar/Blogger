class Removepublishatfromposttable < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :published_at
  end
end
