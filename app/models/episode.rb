# == Schema Information
#
# Table name: episodes
#
#  id                     :integer          
#  plot                   :string          
#  title                  :string           
#  number_of_epiosodes    :integer           
#  season_id :string          
#  created_at             :datetime         not null
#  updated_at             :datetime         not null

class Episode < ApplicationRecord
  belongs_to :season
end