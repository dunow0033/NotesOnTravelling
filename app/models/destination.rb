class Destination < ApplicationRecord
    has_many :users
    has_many :notes, through: :users
end