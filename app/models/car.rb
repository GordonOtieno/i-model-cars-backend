class Car < ApplicationRecord
  has_many :reservations, dependancy: :destroy
end
