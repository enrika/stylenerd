class OutfitsController < ApplicationController

      def index
        @outfits = Outfit.all
        @img = "http://www.placehold.it/640x480"
        @clothings = ClothingItem.all
      end


      def show
        @outfit = Outfit.find(params[:id])
        @clothings = ClothingItem.where(:id => params[:clothing_item_ids])
        @outfiters = @outfit.clothing_items
      end


      def new
        @outfit = Outfit.new
        @clothings = ClothingItem.all
        @tops = ClothingItem.tops

       
      # if @tops.length < 1
          
      end

      def create
        @outfit = Outfit.new(outfit_params) # (outfit_params) is calling the strongs params action
          #find them associated clothing items if any..
        # @clothings = params[:outfit][:clothing_item_ids]
        @clothings = ClothingItem.where(params[:clothing_item_ids])

        @outfit.clothing_items << @clothings
        # clothing = ClothingItem.find(params[:outfits][:clothing_item_ids])
        
        @outfit.save

        if @outfit.save
          
            redirect_to @outfit, notice: 'Cloting Item was successfully created.'

        else
            render 'new'
        end
    
      end 



      def edit
        @outfit = Outfit.find(params[:id]) #get the id parameter from the request
        @clothings = ClothingItem.all 
        @tops = ClothingItem.tops
      end

        
        # if @outfit.outfit_type == ("sweater" || "shirt" || "jacket")
        #   @outfit.form_type = "top"

        #   elsif @outfit.outfit_type == "pants" || "shorts" || "skirt"
        #     @outfit.form_type = "bottom"

        #   elsif @outfit.outfit_type == "dress" || "jumpsuit" || "romper"
        #    @outfit.form_type = "one_piece"

        #   else @outfit.form_type = "misc" 
        # end



 


      def update
          @outfit = Outfit.find(params[:id])
                

              # if @outfit.outfit_type == ("sweater" || "shirt" || "jacket")
              #   @outfit.form_type = "top"

              #   elsif @outfit.outfit_type == "pants" || "shorts" || "skirt"
              #     @outfit.form_type = "bottom"

              #   elsif @outfit.outfit_type == "dress" || "jumpsuit" || "romper"
              #    @outfit.form_type = "one_piece"

              #   else @outfit.form_type = "misc" 
              # end


          if @outfit.update(outfit_params)
            
           

            redirect_to @outfit, notice: 'Cloting Item was successfully updated.'
            @msg = "alert-success"

          else
            render 'edit' #if the update is completed?? redirect to that item
            #else re render the edit view (which is the view we are currently on)
          end
      end


      def destroy
        @outfit = Outfit.find(params[:id]) #get the id parameter from the request
        @outfit.destroy

        redirect_to outfits_path

      end




    private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.

      def outfit_params
        params.require(:outfit).permit(:title, :color, :outfit_type, :form_type, :img_url, {:clothing_item_ids => []} )
      end
  


    end



