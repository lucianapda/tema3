class CreateNotas < ActiveRecord::Migration[5.1]
  def change
    create_table :notas do |t|
    	t.references :caca_palavra
    	t.integer :aluno_id
    	t.decimal :nota, precision: 4, scale: 2
    end
  end
end
