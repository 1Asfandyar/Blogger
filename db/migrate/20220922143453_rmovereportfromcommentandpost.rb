class Rmovereportfromcommentandpost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :report
  end
end
