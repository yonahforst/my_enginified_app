# require_dependency "admin/application_controller"
#
# module Api
#   module V1
#     class UsersController < ApplicationController
#       before_action { |c| c.load_and_authorize_resource(class_name: 'Api::User') }
#       respond_to :json
#
#       # GET /users
#       def index
#       end
#
#       # GET /users/1
#       def show
#       end
#
#       # POST /users
#       def create
#         @user = User.new(user_params)
#         if @user.save
#           render :show
#         else
#           render json: { errors: @user.errors}, status: :unprocessable_entity
#         end
#       end
#
#       # PATCH/PUT /users/1
#       def update
#         if @user.update(user_params)
#           render :show
#         else
#           render json: {errors: @user.errors}, status: :unprocessable_entity
#         end
#       end
#
#       # DELETE /users/1
#       def destroy
#         @user.destroy
#         head :ok
#       end
#
#       private
#         # Only allow a trusted parameter "white list" through.
#         def user_params
#           params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
#         end
#     end
#   end
# end