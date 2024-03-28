class Api::ClientsController < ApplicationController
    protect_from_forgery with: :null_session

    def store
        @client = Client.new(client_params)
        if @client.save
			render json: @client, :status => :created
		end
    end


    private
    
	def client_params
		params.require(:client).permit(:name, :email, :coach)
	end

end
