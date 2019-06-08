class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.string :key
      t.string :value
      t.integer :user_id

      t.timestamps
    end
  end
end
