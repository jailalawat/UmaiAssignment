class ListItem < ApplicationRecord
	self.per_page = 10
	include SoftDeletable
	validates :name, presence: true
  belongs_to :list
end
