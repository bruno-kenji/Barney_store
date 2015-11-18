class Sector < ActiveRecord::Base
  has_many :operators, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  def self.latest
    Sector.order(:updated_at).last
  end
end
