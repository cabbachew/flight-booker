class ChangeDatetimeToDatetimeType < ActiveRecord::Migration[7.0]
  def up
     remove_column :flights, :datetime, :time, null: false
     add_column :flights, :datetime, :datetime, null: false
  end

  def down
    remove_column :flights, :datetime, :datetime, null: false
    add_column :flights, :datetime, :time, null: false
  end
end
