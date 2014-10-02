class Album < ActiveRecord::Base
  SESSION = %w(In_studio Live)

  validates :name, :band_id, presence: true
  validates :session, inclusion: { in: SESSION }

  belongs_to :band, dependent: :destroy, inverse_of: :album
  has_many :tracks, dependent: :destroy, inverse_of: :album


end