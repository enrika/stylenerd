class ClothingItemsController < ApplicationController
  

    def index
      
      @clothings = ClothingItem.all
    end
  

  
end