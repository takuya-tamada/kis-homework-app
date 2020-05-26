class StudiesController < ApplicationController
    def create
=begin
      hairetu = study_params[:user_id]
      hairetu.each do |i|
        study = current_user.studies.build(subject_id: i)
        study.save
      end 
=end
=begin
      @user = current_user
      study = @user.studies.build(subject_id: params)
      study.save
      redirect_to users_path

#このしたは正解,ファボ形式で履修登録できる
=end
     # @user = current_user
      study = current_user.studies.build(subject_id: params[:user_id])
     # study = Subject.find(params[:user_id]).studies.build(user_id: current_user.id)
      study.save
      #redirect_to 'users/index'
      redirect_to controller: :users, action: :record

    end
    def destroy 
      #study = current_user.studies_subjects.find_by(subject_id: params[:user_id])
      study = Study.find_by(subject_id: params[:user_id], user_id:current_user.id)
      study.destroy
      redirect_to '/users/cancel'
    end 
    
    private 
      def study_params
        params.require(:study).permit(user_id: [] )
      end
end
