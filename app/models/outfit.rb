class Outfit < ActiveRecord::Base
has_and_belongs_to_many :clothing_items
end
