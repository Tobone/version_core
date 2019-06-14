class CreateVersionLists < ActiveRecord::Migration[5.2]
  def change
    create_table :versions do |t|
      t.string :number
      t.boolean :is_show
      
      t.timestamps
    end
  end
end