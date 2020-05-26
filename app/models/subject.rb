class Subject < ApplicationRecord
    has_many :studies
    has_many :homeworks
    validates :name, presence: true
    validates :period, presence: true
    validates :day, presence: true
end
