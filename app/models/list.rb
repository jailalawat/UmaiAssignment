class List < ApplicationRecord
	include SoftDeletable
	validates :name, presence: true
	has_many :list_items, dependent: :destroy
end