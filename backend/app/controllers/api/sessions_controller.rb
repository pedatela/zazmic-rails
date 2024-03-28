class Api::SessionsController < ApplicationController
    protect_from_forgery with: :null_session


    def store
        @start = params['start'].to_time
        @session = Session.new(session_params)

        if error_message = validate_session_params
            render json: { status: 'error', message: error_message }, status: :bad_request
            return
        end

        if @session.save
            render json: @session, status: :created
        else
            render json: { status: 'error', message: @session.errors.full_messages }, status: :unprocessable_entity
        end
    end


    private
    
    def validate_session_params
        if isClient.empty?
          "You need to be a client to create a session with coaches"
        elsif isCoach.empty?
          "You can only create sessions with coaches"
        elsif checkedDate
          "Past dates are not permitted"
        elsif !checkAvailability.empty?
          "Session date is not available"
        end
      end


	def session_params
		params.require(:session).permit(:coach_id, :client_id, :start, :duration)
	end

    def isClient
        Client.where(id: @session.client_id, coach: false)
    end

    def isCoach
        Client.where(id: @session.coach_id, coach: true)
    end

    def checkedDate
        Time.now.to_time > @start
    end

    def checkAvailability
        Session.where(coach_id: @session.coach_id, start:  @start)
    end
    
end
