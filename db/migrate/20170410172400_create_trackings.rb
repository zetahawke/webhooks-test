class CreateTrackings < ActiveRecord::Migration[5.0]
  def change
    create_table :trackings do |t|
      t.json :data

      t.timestamps
    end
  end
end
