class Removeindex < ActiveRecord::Migration[5.2]
  def change
    remove_index :active_storage_attachments, ["record_type", "record_id", "name", "blob_id"]
  end
end
