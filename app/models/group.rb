class Group < ApplicationRecord
  has_many :singers,
           :songs
end
