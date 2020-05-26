class Homework < ApplicationRecord
    belongs_to :subject
    has_many :checks
    validates :name, presence: true
    validates :due, presence: true
    validates :subject_id, presence: true
    
end
