class CreateCadenas < ActiveRecord::Migration
  def change
    create_table :cadenas do |t|
      t.string :nombre
      t.timestamps
    end

    create_table :cadenas_relaciones, id: false do |t|
      t.references :cadena
      t.references :relacion
    end
  end
end
