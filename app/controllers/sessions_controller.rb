class SessionsController < ApplicationController
    def new 
    end 

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to root_path, notice: "Successfully signed in"
        else
            flash.now[:notice] = 'Wrong email or password'
            render :new
        end
    end 

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Successfully log out" 
    end
end