class Addreporttouser < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :report, :boolean, :default => false
  end
end
