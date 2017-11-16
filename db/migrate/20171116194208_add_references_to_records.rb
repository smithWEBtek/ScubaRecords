class AddReferencesToRecords < ActiveRecord::Migration[5.1]
  def change
    add_reference :records, :user, foreign_key: true
    add_reference :records, :site, foreign_key: true
  end
end
