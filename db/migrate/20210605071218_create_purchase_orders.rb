class CreatePurchaseOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_orders do |t|
      t.belongs_to :user
      t.float :price
      t.string :video_type

      t.timestamps
    end
  end
end
