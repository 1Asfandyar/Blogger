class Addparentid < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :parent_id, :integer
  end
end
