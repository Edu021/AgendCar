class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :nome
      t.string :telefone
      t.string :email
      t.string :senha

      t.timestamps
    end
  end
end
