class PlacesController < ApplicationController
	def index
		@places = Place.all

		@places = Place.order("name").page(params[:page]).per(4)

	end
end
