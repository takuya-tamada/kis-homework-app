class Homework < ApplicationRecord
    belongs_to :subject
    has_many :checks
    validates :name, presence: true
    validates :due, presence: true
    validates :subject_id, presence: true
    #\d{4}/\d{1,2}/\d{1,2}#
    #validates :due, format: { with: /d{4}/\d{1,2}/\d{1,2}/ }
    #validates :due, numericality: { only_integer: true }
end
