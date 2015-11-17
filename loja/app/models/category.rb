class Category < ActiveRecord::Base
    has_and_belongs_to_many :products
    validates :title, presence: true
    validates :title, uniqueness: true
    
    def self.latest
        Category.order(:updated_at).last
    end
end