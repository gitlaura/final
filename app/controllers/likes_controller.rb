class LikesController < ApplicationController

	def create
		puts params['id']
		like = Like.new
    like.user_id = session['user_id']
    like.venue_id = params['id']
    like.save

    redirect_to "/venues/#{params['id']}"
	end

	def destroy
		puts params['id']
    like = Like.find_by_venue_id(params[:id])
    like.delete

    redirect_to "/venues/#{params['id']}"
	end

end