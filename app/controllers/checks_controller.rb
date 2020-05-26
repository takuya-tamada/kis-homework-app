class ChecksController < ApplicationController
    def create 
        user = current_user 
        check = user.checks.build(homework_id: params[:homework_id])
        check.save 
        redirect_to user_path(current_user)
    end 
    
    def destroy 
        check = Check.find_by(user_id: current_user.id, homework_id: params[:homework_id])
        check.destroy
        redirect_to '/users/submit'
    end 
    
end
