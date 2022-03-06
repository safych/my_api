class Song < ApplicationRecord
  has_one :rating
  belongs_to :group
  belongs_to :disk
end
