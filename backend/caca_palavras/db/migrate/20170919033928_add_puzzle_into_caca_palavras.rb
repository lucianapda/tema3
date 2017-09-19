class AddPuzzleIntoCacaPalavras < ActiveRecord::Migration[5.1]
  def change
  	add_column :caca_palavras, :puzzle, :text
  end
end
