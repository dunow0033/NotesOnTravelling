class User < ApplicationRecord
    has_secure_password

    has_many :notes
    has_many :destinations, through: :notes
end