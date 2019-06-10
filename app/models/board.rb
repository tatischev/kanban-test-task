class Board < ApplicationRecord
	has_many :lists
	validates :id
end
