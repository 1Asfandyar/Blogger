class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :suggestions, :body , :text
  end
end
