class GossipsController < ApplicationController
    def index
        @gossips = Gossip.all
    end

    def show
        @gossips = Gossip.all
        @id = params[:id]
        @x = Gossip.find(params[:id])

    end

    def new
        @gossip = Gossip.new
    end

    def create #permet de récupérer les éléments rentrer par l'user dans le formulaire
       puts params[:title]
       puts params[:content]
       puts "******"
        @gossip = Gossip.new(
             'title' => params[:title],
             'content' => params[:content],
             'user_id' => User.all.sample.id)
	    
        if  @gossip.save
            redirect_to gossips_path, flash: {success: "Gossip cree avec succes" }
        else
            render 'new'
        end
    end

        def edit
            @gossip = Gossip.find(params[:id])
        end

        def update
            @gossip = Gossip.find(params[:id])
            if @gossip.update(title: params[:title],
                              content: params[:content])
            redirect_to gossips_path, flash: {success: "Gossip modifie avec success" }
            else
              render :edit
            end
          end

        def destroy
            @gossip = Gossip.find(params[:id])
            @gossip.destroy
            flash[:danger] = "Le gossip n°#{@gossip.id} a bien été supprimé !"
            redirect_to gossips_path
        end
        end


