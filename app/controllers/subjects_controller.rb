class SubjectsController < ApplicationController
  def new
    @subject = Subject.new
  end

  def show
    @subject = Subject.find(params[:id])
    @homeworks = @subject.homeworks
  end
  
  def edit 
    @subject = Subject.find(params[:id])
  end 
  
  def update 
    @subject = Subject.find(params[:id])
    @subject.update(subject_params)
    redirect_to '/users/cancel'
  end 
  
  def destroy 
    subject = Subject.find(params[:id])
    subject.destroy 
    redirect_to '/users/cancel'
  end 
    
    
  def index
    @subjects = Subject.all
  end
  
  def create 
    @subject = Subject.new(subject_params)
    if @subject.day&&@subject.period
      @subject.classtime = daytime(@subject.day)+@subject.period
    end
    @subject.save 
    redirect_to '/users/record'
  end
  
  
  private
    def subject_params
      params.require(:subject).permit(:name,:day,:period) # tweetモデルのカラムのみを許可
    end
    
    def daytime(day)
      if day=='月'
        return 0
      elsif day =='火'
        return 5
      elsif day=='水'
        return 10
      elsif day=='木'
        return 15
      elsif day=='金'
        return 20
      end
    end
  
end
