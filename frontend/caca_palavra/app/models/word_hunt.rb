class WordHunt < ActiveRecord::Base
  belongs_to :teacher, class_name: 'User'
  belongs_to :team

  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words, allow_destroy: true

  has_many :grades

  validates :name, :words, presence: true

  before_save :equal_words?, :create_puzzle!
  # before_destroy :allow_destroy?

  def apply_grade(student_id, words_found)
    student = User.find(student_id)

    raise 'Não é possível refazer o exercício' if student.grades.where(word_hunt_id: id).present?

    words_found = words.where(word: words_found)

    grade = 10.0 / words.size * words_found.size

    student.grades.create(word_hunt_id: id, grade: grade)
  end

  private

  def equal_words?
    return if words.map(&:word).uniq.size == words.map(&:word).size
    raise 'Não são permitidas palavras iguais.'
  end

  def create_puzzle!
    raise 'Não é possível alterar. Alunos já realizaram o exercício.' if grades.present?
    #https://github.com/jamis/wordsearch/blob/master/bin/wordsearch
    rc = words.map(&:word).map(&:size).max + 10
    self.puzzle = WordSearch::Puzzle.new(words.map(&:word), rows: rc, columns: rc).to_s
  end

  # def allow_destroy?
  #   raise 'Não é possível excluir. Alunos já realizaram o exercício.' if grades.present?
  # end
end
