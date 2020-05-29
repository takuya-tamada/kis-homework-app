class ChecksController < ApplicationController
    def create 
        user = current_user 
        check = user.checks.build(homework_id: params[:homework_id])
        check.save 
        redirect_to user_path(current_user)
       # , alert: "#{Homework.find(params[:homework_id]).name}を提出しました"
        flash[:success] = "#{Homework.find(params[:homework_id]).name}を提出しました"
    end 
    
    def destroy 
        check = Check.find_by(user_id: current_user.id, homework_id: params[:homework_id])
        check.destroy
        redirect_to '/users/submit'
        flash[:success] = "#{Homework.find(params[:homework_id]).name}を未提出の状態に戻しました"
    end 
    
end
