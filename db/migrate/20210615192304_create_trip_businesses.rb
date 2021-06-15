class CreateTripBusinesses < ActiveRecord::Migration[6.1]
  def change
    create_table :trip_businesses do |t|
      t.integer :trip_id
      t.string :yelp_business_id
      t.string :comments

      t.timestamps
    end
  end
end
