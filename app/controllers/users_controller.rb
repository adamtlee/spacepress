class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update]

    def index
        @users = User.all
    end
    def new
        @user = User.new
    end

    def show
        
    end 

    def edit
        
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Account Successfully updated"
            redirect_to articles_path
        else
            render 'edit'
        end 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to Spacepress!, #{@user.username} sign up successful." 
            redirect_to users_path
        else
            render 'new'
        end 
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end
end
