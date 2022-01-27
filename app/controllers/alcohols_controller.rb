class AlcoholsController < ApplicationController
    # before_action :authenticate_user, except: [:index]
    before_action :set_alcohol, only: [:update,:destroy]
    # before_action :check_ownership, only: [:update,:destroy]

    # Get all Alcohols
    def index
        @alcohols = Alcohol.all
        
        if @alcohols.length > 1
            render json: @alcohols
        else
            render json: {error: "No alcohol in database"}, status: 404
        end
    end

    def show
        @alcohol = Alcohol.find_by_name(params[:name])
        puts @alcohol
        if @alcohol
            render json: @alcohol
        else
            render json: {error: "Alcohol not found"}, status:404
        end
    end

    def create
        # @alcohol = current_user.alcohols.create(alcohol_params)
        @alcohol = Alcohol.create(alcohol_params)

        if @alcohol.errors.any?
            render json: @alcohol.errors, status: :unprocessable_entity
        else
            render json: @alcohol, status: 201
        end
    end

    def update
        @alcohol = Alcohol.find_by_id(params[:id])

        @alcohol.update(alcohol_params)

        if @alcohol.errors.any?
            render json: @alcohol.errors, status: :unprocessable_entity
        else
            render json: @alcohol, status: 200
        end

    end

    # DELETE /alcohols/1
    def destroy
        @alcohol.destroy

        render json: :ok
      end

    private
     def alcohol_params
        # params.require(:alcohol).permit(:name,:volume_in_ml,:critical_volume,:user_id)
        params.require(:alcohol).permit(:name,:volume_in_ml,:critical_volume)
     end

     def set_alcohol
        begin
            @alcohol=Alcohol.find(params[:id])
        rescue
            render json: {error: "Alcohol not found"}, status: 404
            
        end

     end


     # This is the logic to check if current user is the alcohol owner OR if the current user is an admin
    #  def check_ownership
    #     if current_user.id === @alcohol.user_id || current_user.admin
    #         return
    #     else
    #         render json: {error: "You don't have permission to do that"}, status: 401
    #     end
    #  end

end
