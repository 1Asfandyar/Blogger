class Actiontextvalidation < ActiveRecord::Migration[5.2]
  def change
    change_column :action_text_rich_texts, :body, :text, null: false
  end
end
