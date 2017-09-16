class CreatePalavras < ActiveRecord::Migration[5.1]
  def change
    create_table :palavras do |t|
    	t.string :palavra
    	t.references :caca_palavra
    end
  end
end
