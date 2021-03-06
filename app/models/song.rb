class Song < ApplicationRecord
	validates :title, presence: true, uniqueness: { scope: :release_year }
	validates :released, inclusion: { in: [true, false] }
	validates :release_year, presence: true, if: :released?
	validates_each :release_year do |song, attr, value|
		song.errors.add(attr, 'must be current year or earlier') if value != nil && value >= DateTime.now.year 
	end
	validates :artist_name, presence: true

	def released?
		released
	end
end
