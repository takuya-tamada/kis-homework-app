class HomeworksController < ApplicationController
  def new
    @homework = Homework.new
    #ソートするにはorder!、破壊的メソッドを使用
    @subjects = current_user.studies_subjects.order!(:classtime)
  end

  def edit
    @homework=Homework.find(params[:id])
    @subjects = current_user.studies_subjects.order!(:classtime)
  end

  def show
  end
  
  def create    
    @homework = Homework.new(homework_params)
    #debugger
    @homework.save 
    redirect_to user_path(current_user)
  end 
  
  def update
    @homework = Homework.find(params[:id])
    @homework.update(homework_params)
    redirect_to user_path(current_user)
  end 
  
  def destroy 
    homework = Homework.find(params[:id])
    homework.destroy
    redirect_to user_path(current_user)
  end 
  


  private
    def homework_params 
      params.require(:homework).permit(:subject_id, :name, :due, :else)
    end
    
end