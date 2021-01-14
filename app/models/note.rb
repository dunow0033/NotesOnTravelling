class Note < ApplicationRecord
    has_many :users
    has_many :destinations, through: :users
end