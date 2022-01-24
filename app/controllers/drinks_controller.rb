class DrinksController < ApplicationController
    before_action :authenticate_user, except: [:index]
    before_action :set_drink, only: [:show,:update,:destroy]
    before_action :check_ownership, only: [:update,:destroy]

    # Get all Drinks
    # def index
    #     @drinks = Drink.all
        
    #     if @drinks.length > 1
    #         render json: @drinks
    #     else
    #         render json: {error: "No drink in database"}, status: 404
    #     end
    # end

    # def create
    #     @drink = current_user.drinks.create(drink_params)

    #     if @drink.errors.any?
    #         render json: @drink.errors, status: :unprocessable_entity
    #     else
    #         render json: @drink, status: 201
    #     end
    # end

    # def update
    #     @drink = Drink.find_by_id(params[:id])

    #     @drink.update(drink_params)

    #     if @drink.errors.any?
    #         render json: @drink.errors, status: :unprocessable_entity
    #     else
    #         render json: @drink, status: 200
    #     end

    # end

    # private
    #  def drink_params
    #     params.require(:drink).permit(:name,:volume_in_ml,:critical_volume,:user_id)
    #  end

    #  def set_drink
    #     begin
    #         @drink=Drink.find(params[:id])
    #     rescue
    #         render json: {error: "Drink not found"}, status: 404
            
    #     end

    #  end


    #  # This is the logic to check if current user is the drink owner OR if the current user is an admin
    #  def check_ownership
    #     if current_user.id === @drink.user_id || current_user.admin
    #         return
    #     else
    #         render json: {error: "You don't have permission to do that"}, status: 401
    #     end
    #  end

end
