class SessionsController < ApplicationController
  
      def new
      end

       def create
        user = User.find_by_email(params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
             remember user
          redirect_to user      #  NEW LINE
        else 
          flash.now[:error] = 'Invalid email/password combination'
          render 'new'
        end
      end

      def destroy
        log_out if logged_in?
        redirect_to root_url
      end 
    def current_user
        if (user_id = cookies.signed[:user_id])
           user = User.find_by(id: user_id)
           if user 
              @current_user = user
           end
        end
      end
end
