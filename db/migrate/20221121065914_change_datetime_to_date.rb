class ChangeDatetimeToDate < ActiveRecord::Migration[7.0]
  def up
    remove_column :flights, :datetime, :datetime, null: false
    add_column :flights, :date, :date, null: false
 end

 def down
   remove_column :flights, :date, :date, null: false
   add_column :flights, :datetime, :datetime, null: false
 end
end
