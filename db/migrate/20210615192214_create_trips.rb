class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.integer :user_id
      t.string :name
      t.string :city
      t.string :state
      t.string :image_url

      t.timestamps
    end
  end
end
