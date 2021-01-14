class Destination < ApplicationRecord
    belongs_to :users
    belongs_to :notes
end