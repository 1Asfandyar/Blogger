class Suggestionsvalidation < ActiveRecord::Migration[5.2]
  def change
    change_column :suggestions, :body, :text, null: false
  end
end
