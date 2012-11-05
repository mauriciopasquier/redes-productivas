class Cadena < ActiveRecord::Base
  attr_accessible :nombre, :relaciones_attributes

  has_and_belongs_to_many :relaciones
  accepts_nested_attributes_for :relaciones

  validates_presence_of :nombre
end
