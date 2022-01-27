# class UsersController < ApplicationController


#   # Get All Users
#   def index
#     @users = User.all

#     if @users.length > 1
#       render json: @users
#     else
#       render json: {error: "No users in the database"}, status: 404
#     end
#   end

#   # View a specific User Account
#   def show

#     @user = User.find_by_username(params[:username])

#     if @user
#     render json: @user
#     else
#       render json: {error: "User not found"}, status:404
#     end

#   end

#   # Updating a specific User Account

#   def update
#     @user = User.find_by_id(params[:id])

#     @user.update(user_params)

#     if @user.errors.any?
#       render json: @user.errors, status: :unprocessable_entity
#     else
#       render json: {username:@user.username}, status: 200
#     end

#   end

#   # Deleting a User Account

#   def destroy
#     @user = User.find_by_id(params[:id])
#     @user.delete
#     render json: 204

#   end

#   # Create User with Knock and bcrypt JWT token
#   def create
#     @user = User.create(user_params)
    
#     if @user.save
#       auth_token = Knock::AuthToken.new payload: {sub: @user.id}
#       p auth_token
#       render json: {username: @user.username, jwt: auth_token.token}, status: :created
#     else
#       render json:@user.errors, status: :unprocessable_entity
#     end
#   end

#   # Sign in with Knock and bcrypt JWT token
#   def sign_in
#     @user = User.find_by_username(params[:username])

#     if @user && @user.authenticate(params[:password])
#       auth_token = Knock::AuthToken.new payload: {sub: @user.id}
#       render json: {username: @user.username, jwt: auth_token.token}, status: 200
#     else
#       render json: {error: "Invalid credientials provided."}, status: 404
#     end

#   end


#   private

#   # User Account params
#   def user_params
#     params.permit(:id,:username,:password,:password_confirmation,:admin)
#   end

#   def set_user


#   end
# end
