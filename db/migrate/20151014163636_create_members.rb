class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :instrument
      t.integer :age
      t.integer :time_in_band
      t.integer :artist_id

      t.timestamps
    end
  end
end
