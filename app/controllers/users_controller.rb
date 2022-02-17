class UsersController < ApplicationController
    def show
        @users = User.all
        @id = params[:id]
    end

    def new
        @users = User.new
    end

    def create
        @users = User.new(
            'first_name' => params[:first_name],
            'last_name' => params[:last_name],
            'description' => params[:description],
            'age' => params[:age],
            'city_id' => params[:city_id],
            'email' => params[:email],
            'password' => params[:password_digest])
        if  @users.save
            redirect_to gossips_path, flash: {success: "Utilisateur cree avec success" }
        else
            render 'new'
        end
    end

end
