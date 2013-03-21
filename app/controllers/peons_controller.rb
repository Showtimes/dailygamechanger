class PeonsController < ApplicationController

	def new

	end

	def create
		peon = Peon.create(
			:email => params[:peon][:email],
			:ip_at_signup => request.remote_ip,
			:tracking_code => params[:peon][:tracking],
			:name => params[:peon][:name],
			:unsubscribe_token => (0...10).map{(65+rand(26)).chr}.join
			)

		if peon.save
			redirect_to success_path
		else
			redirect_to :back, :flash => {:error => "eek! #{peon.errors.full_messages[0]}!"}
		end
	end

	def show

	end

	def unsubscribe

	end 

end