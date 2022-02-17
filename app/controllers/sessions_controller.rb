class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
			if user && user.authenticate(params[:password])
                session[:user_id] = user.id
            redirect_to gossips_path, flash: {success: "Welcome back" }
        else
            render 'new'
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:success] = "Deconnexion réussie"
        render "sessions/new"
    end
end
