class RestaurantesController < ApplicationController
    def index
        @restaurantes = Restaurante.order :nome
    end
    
    def show
         @restaurante = Restaurante.find(params[:id])   
    end

end
