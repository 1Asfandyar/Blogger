class Addnullfalseinlikes < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :user_id, :bigint, null: false
  end
end
