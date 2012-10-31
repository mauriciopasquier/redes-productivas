class AgregarHs12EnProductos < ActiveRecord::Migration
  def change
    add_column :productos, :hs12_id, :integer
  end
end
