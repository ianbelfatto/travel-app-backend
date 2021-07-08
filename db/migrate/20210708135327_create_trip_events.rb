class CreateTripEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_events do |t|
      t.integer :trip_id
      t.string :yelp_event_id
      t.string :comments

      t.timestamps
    end
  end
end
