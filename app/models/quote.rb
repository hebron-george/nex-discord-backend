class Quote < ApplicationRecord
  scope :search, -> (keyword) { where(arel_table[:message].matches("%#{keyword}%")) }
end
