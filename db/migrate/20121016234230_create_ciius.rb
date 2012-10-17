class CreateCiius < ActiveRecord::Migration
  def change
    create_table :ciius do |t|
      t.integer :codigo
      t.string :descripcion
      t.text :comentario
    end
  end
end
