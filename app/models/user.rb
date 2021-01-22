class User < ApplicationRecord
    has_secure_password

    has_many :destinations
    has_many :notes, through: :destinations

    validates :name, presence: true
end