class Destination < ApplicationRecord
    has_many :notes
    has_many :users, through: :notes

    validates :name, presence: true

    scope :most_notes, -> {(
        select("destinations.name, count(destinations.id) as destination_count")
        .joins(:notes)
        .group("destinations.id")
        .order("destination_count DESC")
        .limit(1)
        )}
end