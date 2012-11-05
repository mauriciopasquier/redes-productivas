class Relacion < ActiveRecord::Base
  attr_accessible :entrada, :entrada_id,  :entrada_attributes,
                  :salida,  :salida_id,   :salida_attributes

  belongs_to :entrada,   polymorphic: true
  belongs_to :salida,  polymorphic: true

  has_and_belongs_to_many :cadenas

  accepts_nested_attributes_for :entrada, :salida

  validates_presence_of :entrada, :salida
end
