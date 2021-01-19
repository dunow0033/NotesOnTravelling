class Note < ApplicationRecord
    belongs_to :user
    belongs_to :destination

    validates :content, presence: true
end