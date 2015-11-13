class Sector < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: true

  def self.latest
    Sector.order(:updated_at).last
  end
end
