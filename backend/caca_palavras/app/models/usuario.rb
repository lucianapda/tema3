class Usuario < ActiveRecord::Base
  extend Enumerize

  enumerize :tipo, in: { :professor => 1, :aluno => 2 }, predicates: { prefix: true }

  validates :nome, :email, :tipo, presence: true 
end
