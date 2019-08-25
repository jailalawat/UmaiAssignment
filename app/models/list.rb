class List < ApplicationRecord
	self.per_page = 10
	include SoftDeletable
	validates :name, presence: true
	has_many :list_items, inverse_of: :list, dependent: :destroy

	accepts_nested_attributes_for :list_items, reject_if: :all_blank, allow_destroy: true
end