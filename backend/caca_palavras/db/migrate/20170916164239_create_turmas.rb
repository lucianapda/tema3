class CreateTurmas < ActiveRecord::Migration[5.1]
  def change
    create_table :turmas do |t|
    	t.string :nome
    end
  end
end
