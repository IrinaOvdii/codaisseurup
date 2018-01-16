class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories



  validates :name, presence: true
  validates :location, presence: true, length: { maximum: 500 }
  validates :price, presence: true


end
