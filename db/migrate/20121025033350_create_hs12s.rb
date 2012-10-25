class CreateHs12s < ActiveRecord::Migration
  def change
    create_table :hs12s do |t|
      t.string :codigo
      t.string :descripcion
    end
  end
end
