class ClothingItemsController < ApplicationController
  
  
      


      def index
      
      @clothings = ClothingItem.all
      end


      def show
      @clothing = ClothingItem.find(params[:id])
      end


      def new
        @clothing = ClothingItem.new
      end

    
      def edit
        @clothing = ClothingItem.find(params[:id]) #get the id parameter from the request
        @clothing_title = ClothingItem.find(params[:id])
      end
    
  
      def create
        @clothing = ClothingItem.new(clothing_params) # this is calling the strongs params action
        
        
        if @clothing.clothing_type == ("sweater" || "shirt" || "jacket")
          @clothing.form_type = "top"

          elsif @clothing.clothing_type == "pants" || "shorts" || "skirt"
            @clothing.form_type = "bottom"

          elsif @clothing.clothing_type == "dress" || "jumpsuit" || "romper"
           @clothing.form_type = "one_piece"

          else @clothing.form_type = "misc" 
        end



        if @clothing.save
          redirect_to @clothing, notice: 'Cloting Item was successfully created.'

        else
          render 'new'
        end
    
      end  


        




    def update
        @clothing = ClothingItem.find(params[:id])
              

            if @clothing.clothing_type == ("sweater" || "shirt" || "jacket")
              @clothing.form_type = "top"

              elsif @clothing.clothing_type == "pants" || "shorts" || "skirt"
                @clothing.form_type = "bottom"

              elsif @clothing.clothing_type == "dress" || "jumpsuit" || "romper"
               @clothing.form_type = "one_piece"

              else @clothing.form_type = "misc" 
            end






        if @clothing.update(clothing_params)
          
         

          redirect_to @clothing, notice: 'Cloting Item was successfully updated.'
        @msg = "alert-success"

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


    
