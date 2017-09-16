class Usuario < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable, :registerable, :validatable

  include DeviseTokenAuth::Concerns::User

  enumerize :tipo, in: { :professor => 1, :aluno => 2 }, predicates: { prefix: true }

  validates :nome, :email, :tipo, presence: true 
end
