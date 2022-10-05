class MyController < ApplicationController
    include ActionController::Live
  
    def stream
      response.headers['Content-Type'] = 'text/event-stream'
      10.times {
        Rails.logger.debug "ping..."
        response.stream.write "hello world\n"
        sleep 1
      }
    ensure
      response.stream.close
    end
end
  
