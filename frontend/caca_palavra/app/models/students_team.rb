class StudentsTeam < ActiveRecord::Base
  belongs_to :student, class_name: 'User'
  belongs_to :team
end
