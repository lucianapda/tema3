class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :word
      t.integer :word_hunt_id
    end

    add_index :words, :word_hunt_id
  end
end
