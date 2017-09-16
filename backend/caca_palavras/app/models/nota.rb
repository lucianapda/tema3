class Nota < ActiveRecord::Base
  belongs_to :caca_palavra

  has_many :alunos_notas
 
  validates :nota, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
