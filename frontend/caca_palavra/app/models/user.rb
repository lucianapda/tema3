class User < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  self.inheritance_column = nil

  has_many :grades, foreign_key: 'student_id'

  has_many :students_teams, foreign_key: 'student_id'
  has_many :teams, through: :students_teams

  has_many :word_hunts, foreign_key: 'teacher_id', class_name: 'User'

  enumerize :type, in: { :teacher => 1, :student => 2 }, predicates: { prefix: true }

  validates :name, :email, :type, presence: true
end
