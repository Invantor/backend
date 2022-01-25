class MixersController < ApplicationController
    before_action :authenticate_user, except: [:index]
    before_action :set_mixer, only: [:update,:destroy]
    before_action :check_ownership, only: [:update,:destroy]

    # Get all Mixers
    def index
        @mixers = Mixer.all
        
        if @mixers.length > 1
            render json: @mixers
        else
            render json: {error: "No mixer in database"}, status: 404
        end
    end

    def show
        @mixer = Mixer.find_by_name(params[:name])
        puts @mixer
        if @mixer
            render json: @mixer
        else
            render json: {error: "Alcohol not found"}, status:404
        end
    end

    def create
        @mixer = current_user.mixers.create(mixer_params)

        if @mixer.errors.any?
            render json: @mixer.errors, status: :unprocessable_entity
        else
            render json: @mixer, status: 201
        end
    end

    def update
        @mixer = Mixer.find_by_id(params[:id])

        @mixer.update(mixer_params)

        if @mixer.errors.any?
            render json: @mixer.errors, status: :unprocessable_entity
        else
            render json: @mixer, status: 200
        end

    end

    def destroy
        @mixer.destroy

        render json: :ok
      end

    private
     def mixer_params
        params.require(:mixer).permit(:name,:volume_in_ml,:critical_volume,:user_id)
     end

     def set_mixer
        begin
            @mixer=Mixer.find(params[:id])
        rescue
            render json: {error: "Mixer not found"}, status: 404
            
        end

     end


     # This is the logic to check if current user is the mixer owner OR if the current user is an admin
     def check_ownership
        if current_user.id === @mixer.user_id || current_user.admin
            return
        else
            render json: {error: "You don't have permission to do that"}, status: 401
        end
     end

end
