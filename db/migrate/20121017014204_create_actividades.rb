class CreateActividades < ActiveRecord::Migration
  def change
    create_table :actividades do |t|
      t.string :nombre
      t.string :descripcion

      t.references :ciiu

      t.timestamps
    end
  end
end
