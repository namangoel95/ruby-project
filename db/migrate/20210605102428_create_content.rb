class CreateContent < ActiveRecord::Migration[6.0]
  def change
    create_table :contents do |t|
    	t.references :purchase_order
    	t.references :purchasable, polymorphic: true
    end
  end
end
