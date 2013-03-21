class ChangersController < ApplicationController

	def new
	end

	def create
	end

	def show
		@game_changer = Changer.find(params[:id])
	end

end