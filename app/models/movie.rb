# == Schema Information
#
# Table name: movies
#
#  id                     :integer          
#  plot                   :string          
#  title                  :string                
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
class Movie < ApplicationRecord
  has_many :contents , as: :purchasable
end