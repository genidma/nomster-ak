class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	
	def index
		@places = Place.all
	
		@places = Place.order("name").page(params[:page]).per(5)
	end

	def new
		@place = Place.new
	end

	def create
		Place.create(place_params)
		redirect_to_root_path
	end

	def create
		current_user.places.create(place_params)
		redirect_to_root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end
