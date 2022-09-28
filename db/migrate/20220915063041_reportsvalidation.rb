class Reportsvalidation < ActiveRecord::Migration[5.2]
  def change
    change_column :reports, :reportable_id, :bigint, null: false
    change_column :reports, :reportable_type, :string, null: false
  end
end
