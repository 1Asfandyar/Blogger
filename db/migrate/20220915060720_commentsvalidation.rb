class Commentsvalidation < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :body, :text, null: false
    change_column :comments, :user_id, :integer, null: false
    change_column :comments, :post_id, :integer, null: false


  end
end
