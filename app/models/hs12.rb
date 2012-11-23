class Hs12 < ActiveRecord::Base
  attr_accessible :codigo, :descripcion

  has_many :productos

  validates_uniqueness_of :codigo
end
