class Palavra < ActiveRecord::Base
  belongs_to :caca_palavra

  validates :palavra, presence: true 
end
