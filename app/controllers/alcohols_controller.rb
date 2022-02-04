class AlcoholsController < ApplicationController
    before_action :authenticate_user, except: [:index]
    before_action :set_alcohol, only: [:update,:destroy]
    before_action :check_ownership, only: [:destroy]

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
        @alcohol = current_user.alcohols.create(alcohol_params)
        if @alcohol.save
            render json:{message: "Successfully Created", data:@alcohol}, status: 201
        else
            render json: { error: @alcohol.errors.full_messages[0]}, status: 500
        end
    end

    def update
        @alcohol = Alcohol.find_by_id(params[:id])

        if @alcohol.update(alcohol_params)
            render json:{message: "Successfully Updated",data:@alcohol}, status: 200
        else
            render json: {error: @alcohol.errors.full_messages[0]}, status: 500
        end
    end

    # DELETE /alcohols/1
    def destroy
        if @alcohol.destroy
            render json: { message: "Successfully deleted"}, status: :ok
        else
            render json: { error: @alcohol.errors.full_messages[0]}, status: 500
        end
      end

    private
     def alcohol_params
        params.require(:alcohol).permit(:name,:volume_in_ml,:critical_volume,:user_id)
     end

     def set_alcohol
        begin
            @alcohol=Alcohol.find(params[:id])
        rescue
            render json: {error: "Alcohol not found"}, status: 404
            
        end

     end


     # This is the logic to check if current user is the alcohol owner OR if the current user is an admin
     def check_ownership
        if current_user.admin
            return
        else
            render json: {error: "You don't have permission to do that"}, status: 401
        end
     end

end
