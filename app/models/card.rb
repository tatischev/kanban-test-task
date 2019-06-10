class Card < ApplicationRecord
	belongs_to :list
	validates :list_id, presence: true
	validates :title
end
