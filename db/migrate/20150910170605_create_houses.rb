class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
			t.timestamps null: false
			t.string :city
			t.string :country
			t.string :image
			t.string :price
		end
	end
end

