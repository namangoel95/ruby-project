# == Schema Information
#
# Table name: seasons
#
#  id                     :integer          
#  plot                   :string          
#  title                  :string   
#  number                 :integer

#  created_at             :datetime         not null
#  updated_at             :datetime         not null

class Season < ApplicationRecord
  has_many :episodes, -> { order :number }
  has_many :contents , as: :purchasable
end