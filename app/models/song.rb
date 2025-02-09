class Song < ActiveRecord::Base
    validates :title, presence: true, uniqueness: { scope: %i[artist_name release_year] }
    validates :release_year, presence: true, if: :released
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: :released
end