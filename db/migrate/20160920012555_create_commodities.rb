class CreateCommodities < ActiveRecord::Migration[5.0]
  def change
    create_table :commodities do |t|
      t.integer :shop_owner_id
      t.integer :shipper_id
      t.string :title
      t.string :description
      t.float :price_deposite
      t.float :price_wage
      t.string :departures
      t.string :destination
      t.boolean :picked

      t.timestamps
    end
  end
end
