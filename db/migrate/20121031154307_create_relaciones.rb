class CreateRelaciones < ActiveRecord::Migration
  def change
    create_table :relaciones do |t|
      t.belongs_to :entrada, polymorphic: true
      t.belongs_to :salida, polymorphic: true
      t.timestamps
    end
  end
end
