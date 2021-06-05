class Content < ApplicationRecord
  belongs_to :purchasable, polymorphic: true
  belongs_to :purchase_order
end