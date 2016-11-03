class Api::V1::UsersController < ApplicationController
	def new
		@user=User.new
	end
	def index
		@user=User.all
		render json: {message: 'successfully listed', data:@user, status_code:20}

	end
	def show
	@user=User.find_by_id(params[:id])
	render json: {message: 'successfully displayed', data:@user, status_code:200}

	end
	def update
		@user=User.find_by_id(params[:id])
		@user.update_attributes(user_params)
		render json: {message: 'successfully updated', data:@user, status_code:200}
	end
	def destroy
		@user=User.find_by_id(params[:id])
		render json: {message: 'successfully deleted', data:@user, status_code:200}
		@user.destroy

	end

	def create
		@user=User.new(user_params)
		if @user.save
		render json: {message: 'successfully created', data:@user, status_code:201}
	else
			render json: {message: 'failure', data:@user.errors, status_code:422}
	
	end

	end
	private 

	def user_params
		params.require(:user).permit(:name,:age,:role,:gender)
	end
end