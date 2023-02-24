class User < ApplicationRecord
  has_many :reservations, dependancy: :destroy
end
