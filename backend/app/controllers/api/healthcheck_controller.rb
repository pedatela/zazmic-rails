class Api::HealthcheckController < ApplicationController

    def index
        render json: {
            uptime: Process.clock_gettime(Process::CLOCK_MONOTONIC),
            message: "string",
            date: Time.now.to_time
        } 
    end

end
