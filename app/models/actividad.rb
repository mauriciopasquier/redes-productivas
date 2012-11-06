class Actividad < ActiveRecord::Base
  attr_accessible :descripcion, :nombre, :ciiu_id

  belongs_to :ciiu
  delegate :codigo, to: :ciiu

  has_many :origenes, class_name: 'Relacion', as: :salida, dependent: :destroy
  has_many :entradas, through: :origenes,
            source: :entrada, source_type: 'Producto'

  has_many :destinos, class_name: 'Relacion', as: :entrada, dependent: :destroy
  has_many :salidas, through: :destinos,
            source: :salida, source_type: 'Producto'

  validates_uniqueness_of :nombre
  validates_presence_of :nombre
end
