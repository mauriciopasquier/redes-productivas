class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :hs12_id

  belongs_to :hs12
  delegate :codigo, to: :hs12
end
