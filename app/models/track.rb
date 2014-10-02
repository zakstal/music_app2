class Track < ActiveRecord::Base
  valideates :name, :album_id, :track_type, presence: true

  belongs_to :album, inverse_of: :track
  has_one :band, through: :album, source: :band

end