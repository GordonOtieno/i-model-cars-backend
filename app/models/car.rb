class Car < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :make, presence: true
  validates :description, presence: true
  validates :cost, presence: true, numericality: { greater_than: 0 }
  validates :speed, presence: true, numericality: { greater_than: 0 }
  # validates :color, presence: true
end
