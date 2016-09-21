class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :shipper_id
      t.integer :commodity_id
      t.string :description

      t.timestamps
    end
  end
end

