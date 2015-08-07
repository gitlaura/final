class HoldsController < ApplicationController
	
	def create
		puts params['id']
		hold = Hold.new
    hold.user_id = session['user_id']
    hold.venue_id = params['id']
    hold.save

    redirect_to "/venues/#{params['id']}"
	end

	def destroy
		puts params['id']
    hold = Hold.find_by_venue_id(params[:id])
    hold.delete

    redirect_to "/venues/#{params['id']}"
	end

end