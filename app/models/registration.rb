class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :guest_count, numericality: { less_than_or_equal_to: 3 }


end
