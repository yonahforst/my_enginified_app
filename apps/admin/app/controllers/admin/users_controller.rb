require_dependency "admin/application_controller"

module Admin
  class UsersController < ApplicationController

    # GET /users
    def index
    end

    # GET /users/1
    def show
    end

    # GET /users/new
    def new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /users/1
    def update
      # required for settings form to submit when password is left blank
      if user_params[:password].blank?
        user_params.delete("password")
        user_params.delete("password_confirmation")
      end
      
      if @user.update(user_params)
        @user.confirm!        
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private

      # Only allow a trusted parameter "white list" through.
      def user_params
        @user_params ||= params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
  end
end
