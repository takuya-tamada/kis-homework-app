class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :studies
  has_many :checks
  has_many :studies_subjects, through: :studies, source: :subject
  has_many :checks_homeworks, through: :checks, source: :homework
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
