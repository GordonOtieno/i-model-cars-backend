class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :car_type, presence: true
  validates :make, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :cost, presence: true
  validates :speed, presence: true
  validates :color, presence: true

end
