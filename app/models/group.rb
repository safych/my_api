class Group < ApplicationRecord
  has_many :singers
  has_many :songs
end
