class Likesvalidation < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :likeable_id, :bigint, null: false

    change_column :likes, :likeable_type, :string, null: false
  end
end
