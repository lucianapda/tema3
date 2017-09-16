class CacaPalavra < ActiveRecord::Base
  belongs_to :professor, class_name: 'Usuario'
  belongs_to :turma
 
  has_many :palavras, dependent: :destroy
  accepts_nested_attributes_for :palavras, allow_destroy: true

  has_many :notas
 
  validates :nome, presence: true 
end
