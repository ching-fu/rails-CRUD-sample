class CreateUbikes < ActiveRecord::Migration
  def change
    create_table :ubikes do |t|
      t.string :name
      t.string :addr

      t.timestamps null: false
    end
  end
end
