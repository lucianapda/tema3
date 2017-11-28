class Grade < ActiveRecord::Base
  belongs_to :word_hunt
  belongs_to :student, class_name: 'User'
 
  validates :grade, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
