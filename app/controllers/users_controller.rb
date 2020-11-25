class UsersController < ApplicationController
    def new 
        @user = User.new
    end 
    
    def create 
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: 'User was successfully created'
        else
            render :new, notice: "Something went wrong"
        end
    end 

    def show 
        @user = User.find_by(id: params[:id])
        @stories = @user.stories
    end

    private 

    def user_params 
        params.require(:user).permit(:name, :email, :password)
    end
end