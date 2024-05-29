class ApplicationController < ActionController::Base
    before_action :set_intercom_user
  
    private
  
    def set_intercom_user
      if user_signed_in?
        IntercomRails.config.user.current = Proc.new { 
          {
            user_id: current_user.id,
            email: current_user.email,
            created_at: current_user.created_at.to_i,
            name: current_user.email 
          }
        }
      end
    end
end
