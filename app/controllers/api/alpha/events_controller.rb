class Api::Alpha::EventsController < Api::Alpha::ApplicationController
    
   
   
    def index
        events = Event.all
        render json: events
    end

    def create
        event = Event.new(params_event)
        if event.save
            render json: event, status: :created
        else
            puts event.errors.full_messages
            render json: event.errors, status: :unprocessable_entity
        end
        return
    end
    protected
  
  

    private
    
    def params_event
        params.require(:event).permit(:title, :date,:user_id)
    end 
end