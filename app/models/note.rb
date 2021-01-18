class Note < ApplicationRecord
    belongs_to :users
    belongs_to :destinations

    validates :content, presence: true
end