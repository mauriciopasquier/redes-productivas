class Relacion < ActiveRecord::Base
  attr_accessible :entrada, :salida

  belongs_to :entrada,   polymorphic: true
  belongs_to :salida,  polymorphic: true

  has_and_belongs_to_many :cadenas
end
