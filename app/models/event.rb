class Event < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :photos
  has_many :registrations, dependent: :destroy
  has_many :guests, through: :registrations, source: :user



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

  def self.alphabetical
    order(name: :desc)
  end

  scope :starts_before_ends_after, ->(starts_at, ends_at) {
    where('starts_at < ? AND ends_at > ?', starts_at, ends_at )}

  

end
