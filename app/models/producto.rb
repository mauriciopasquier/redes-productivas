class Producto < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :hs12_id

  belongs_to :hs12
  delegate :codigo, to: :hs12

  has_many :destinos, class_name: 'Relacion', as: :entrada
  has_many :salidas, through: :destinos, source: :salida,
            source_type: 'Actividad'

  has_many :origenes, class_name: 'Relacion', as: :salida
  has_many :entradas, through: :origenes, source: :entrada,
            source_type: 'Actividad'
end
