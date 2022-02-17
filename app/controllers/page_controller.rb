class PageController < ApplicationController
  def home
    @gossips = Gossip.all
  end

  def team
  end

  def contact
  end

  def welcome
    @first_name = params[:first_name]
  end

  def potin
    @gossips = Gossip.all
    @id = params[:id]
  end

  def auteur
    @gossips = Gossip.all
    @title = params[:title]
  end
  
end
