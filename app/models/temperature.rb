class Temperature < ApplicationRecord
  validates :warm_bottom_temp, presence: true
  validates :warm_top_temp, presence: true
  validates_numericality_of :warm_top_temp, greater_than: :warm_bottom_temp
end
