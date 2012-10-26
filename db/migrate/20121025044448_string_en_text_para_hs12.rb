class StringEnTextParaHs12 < ActiveRecord::Migration
  def up
    change_column :hs12s, :descripcion, :text
  end

  def down
    change_column :hs12s, :descripcion, :string
  end
end
