class UsersController < ApplicationController
    before_action :signed_in_user, only: [:index, :edit, :update]
    before_action :correct_user,   only: [:edit, :update]

    def index
        @users = User.paginate(page: params[:page])
    end
    
    def show
        @user = User.find(params[:id])
    end
    
  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
          sign_in @user
          flash[:success] = "Bienvenido a Mi Quiniela MX!"
          redirect_to @user
      else
          render 'new'
      end      
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
      if @user.update_attributes(user_params)
          flash[:success] = "Su perfil ha sido actualizado"
          redirect_to @user
      else
          render 'edit'
      end
  end

  private

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)        
    end

    # Before filters

    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Por favor, debe iniciar una sesión primero."
        end
    end

    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
