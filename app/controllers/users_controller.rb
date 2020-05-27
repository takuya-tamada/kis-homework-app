class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @subjects = Subject.all 
    @user = User.find(params[:id]) 
    @studies_subjects = @user.studies_subjects
   # @homeworks = @studies_subjects.homeworks
    @homeworks = Homework.all.where(subject_id: current_user.studies_subjects).where.not(id: current_user.checks_homeworks).where('due >= ?', Time.zone.now).order!(:due)
    #@homeworks = Homework.all.where(subject_id: current_user.studies_subjects).where.not(id: current_user.checks.homework_id) 今日より向こうのものを↑で指定
    #userモデルでhas_many through定義せずに上の感じでやったらダメだった
  end
  
  def submit
    @homeworks = Homework.all.where(id: current_user.checks_homeworks).includes(:checks).order("checks.created_at desc")
    #Model.includes(:another_model).order("another_models.name desc") 結局includesにもsつける、belongs_toでsつけてるからかと
  end 
  
  def record 
    @user = current_user 
    
    @study = Study.new
    @subjects = Subject.all.where.not(id: @user.studies_subjects).order!(:classtime)
  end
  
  def cancel 
    @subjects = Subject.all.where(id: current_user.studies_subjects).order!(:classtime)
  end
  
  
end
