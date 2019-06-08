class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.boolean :tfl
      t.boolean :youtube
      t.boolean :weather
      t.integer :user_id

      t.timestamps
    end
  end
end
