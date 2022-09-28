class Addnullfalseinreports < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :user_id, :integer, null: false
  end
end
