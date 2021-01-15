class Note < ApplicationRecord
    belongs_to :users
    belongs_to :destinations
end