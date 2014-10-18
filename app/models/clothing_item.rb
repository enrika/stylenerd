class ClothingItem < ActiveRecord::Base

has_and_belongs_to_many :outfits

scope :tops, -> { where(form_type: 'top') }
  
end
