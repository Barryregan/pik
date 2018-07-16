module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_photographer
    
    def connect
      self.current_photographer = find_current_user
    end
    
    def disconnect
    end
    
    protected
    def find_current_user
      if current_photographer =Photographer.find_by(id: cookies.signed[:photographer_id])
         current_photographer
      else
        reject_unauthorized_connection
      end
    end
  end
end
