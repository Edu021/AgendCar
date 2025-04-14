class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :nome
      t.string :telefone
      t.string :email, null: false, default: ""
      t.string :password_digest # mudado para password_digest

      t.timestamps
    end
  end
end
