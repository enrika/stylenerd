class ClothingItemsController < ApplicationController
  

    def index
      
      @clothings = ClothingItem.all

    end

    def show
      @clothing = ClothingItem.find(params[:id])
    end


#new and create go together
    
      def new
        @clothing = ClothingItem.new
      end
    

      def create
        @clothing = ClothingItem.new(clothing_params)
 
          if @clothing.save
            redirect_to @clothing
           else
            render 'new'
          end
      end
    

 

##################

#edit and update go together

    def edit
      @clothing = ClothingItem.find(params[:id]) #get the id parameter from the request
      @clothing_title = ClothingItem.find(params[:id])
    end


    def update
      @clothing = ClothingItem.find(params[:id])

        if @clothing.update
          redirect_to @clothing
        else
          render 'edit' #if the update is completed?? redirect to that item
          #else re render the edit view (which is the view we are currently on)
        end
    end


    
  
  def destroy
      @clothing = ClothingItem.find(params[:id]) #get the id parameter from the request
      @clothing.destroy

      redirect_to clothing_items_path

    end
  
 private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def clothing_params
      params.require(:clothing_item).permit(:title, :color, :clothing_type, :form_type, :img_url )
    end
  
  
end