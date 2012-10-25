class Hs12 < ActiveRecord::Base
  attr_accessible :codigo, :descripcion

  has_many :productos
end
