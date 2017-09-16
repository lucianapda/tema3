class DeviseTokenAuthCreateUsuarios < ActiveRecord::Migration[5.1]
  def change
    create_table(:usuarios) do |t|
      ## Required
      t.string :provider, :null => false, :default => "email"
      t.string :uid, :null => false, :default => ""

      ## Database authenticatable
      t.string :encrypted_password, :null => false, :default => ""

      ## User Info
      t.string :nome
      t.string :email
      t.integer :tipo

      ## Tokens
      t.text :tokens

      t.timestamps
    end

    add_index :usuarios, :email,                unique: true
    add_index :usuarios, [:uid, :provider],     unique: true
  end
end
