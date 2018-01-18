class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos



  validates :name, presence: true
  validates :location, presence: true, length: { maximum: 500 }
  validates :price, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true


  def bargain?
   price < 30
  end

  def self.order_by_price
    order :price
  end

end
