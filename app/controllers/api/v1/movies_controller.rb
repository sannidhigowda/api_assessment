class Api::V1::MoviesController < ApplicationController
	def new
		@movie=Movie.new
	end
	def index
		@movie=Movie.all
		render json: {message: 'successfully listed', data:@movie, status_code:20}

	end
	def show
	@movie=Movie.find_by_id(params[:id])
	render json: {message: 'successfully displayed', data:@movie, status_code:200}

	end
	def update
		@movie=Movie.find_by_id(params[:id])
		@movie.update_attributes(movie_params)
		render json: {message: 'successfully updated', data:@movie, status_code:200}
	end
	def destroy
		@movie=Movie.find_by_id(params[:id])
		render json: {message: 'successfully deleted', data:@movie, status_code:200}
		@movie.destroy

	end

	def create
		@movie=Movie.new(movie_params)
		if @movie.save
		render json: {message: 'successfully created', data:@movie, status_code:201}
	else
			render json: {message: 'failure', data:@movie.errors, status_code:422}
	
	end

	end
	private 

	def movie_params
		params.require(:movie).permit(:title,:year,:rating,:language,:actors,:director,:producer)
	end
end