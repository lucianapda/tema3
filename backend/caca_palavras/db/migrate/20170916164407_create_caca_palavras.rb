class CreateCacaPalavras < ActiveRecord::Migration[5.1]
  def change
    create_table :caca_palavras do |t|
    	t.string :nome
    	t.integer :professor_id
    	t.integer :turma_id
    end
  end
end
