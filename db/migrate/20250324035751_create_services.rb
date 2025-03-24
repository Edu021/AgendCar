class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :nome_servico
      t.text :descricao
      t.float :preco

      t.timestamps
    end
  end
end
