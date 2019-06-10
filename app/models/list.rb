class List < ApplicationRecord
	has_many :cards
	belongs_to :board
	validates :board_id
	validates :id
end
