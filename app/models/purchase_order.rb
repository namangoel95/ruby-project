# == Schema Information
#
# Table name: purchase_orders
#
#  id                     :integer          
#  user_id                :integer          
#  purchasable_type       :string  
#  purchasable_id         :integer  
#  price                  :float

#  created_at             :datetime         not null
#  updated_at             :datetime         not null

class PurchaseOrder < ApplicationRecord
  belongs_to :user
  has_many :contents
end