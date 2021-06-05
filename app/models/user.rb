# == Schema Information
#
# Table name: users
#
#  id                     :integer          
#  email                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null

class User < ApplicationRecord
  has_many :purchase_orders
  has_many :contents, through: :purchase_orders
end