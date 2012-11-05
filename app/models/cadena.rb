class Cadena < ActiveRecord::Base
  attr_accessible :nombre

  has_and_belongs_to_many :relaciones

  validates_presence_of :nombre
end
