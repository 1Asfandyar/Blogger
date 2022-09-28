class SetDefaultValue < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :published, :boolean,  default: "false"
  end
end
