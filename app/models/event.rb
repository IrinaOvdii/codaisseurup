class Event < ApplicationRecord
  belongs_to :user



  validates :name, presence: true
  validates :location, presence: true, length: { maximum: 500 }
  validates :price, presence: true

  
end
