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

	def update
		peon = Peon.find params[:id]
		if params[:resubscribe].present?
			peon.resubscribe
			redirect_to resubscribed_path
		else
			redirect_to bad_key_path
		end
	end

	def unsubscribe
		peon = Peon.find params[:id]
		if peon && params[:grendel].present?
			if peon.unsubscribe_token == params[:grendel]
				peon.unsubscribe
				redirect_to unsubscribed_path(peon)
			else
				redirect_to bad_key_path
			end
		else
			redirect_to bad_key_path
		end

	end 

	def unsubscribed
		@peon = Peon.find(params[:id])
		puts @peon
	rescue => e
		puts e.inspect
		@peon = nil
	end

end