class CitiesController < ApplicationController
    def show
        # @cities = City.all
        # @id = params[:id]
        @city = City.find(params[:id])

        @user_id_array=User.where(city_id:params[:id]).pluck(:id)
 			Gossip.all.each do |gossip|
			if @user_id_array.include?(gossip.user_id)
			end
		end
    end
end
