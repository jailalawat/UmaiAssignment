class ListItem < ApplicationRecord
	include SoftDeletable
	validates :name, presence: true
  belongs_to :list
end
