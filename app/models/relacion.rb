class Relacion < ActiveRecord::Base
  attr_accessible :entrada, :entrada_id,  :entrada_attributes,
                  :salida,  :salida_id,   :salida_attributes,
                  :direccion
  attr_accessor :direccion

  belongs_to :entrada,   polymorphic: true
  belongs_to :salida,  polymorphic: true

  has_and_belongs_to_many :cadenas

  accepts_nested_attributes_for :entrada, :salida

  validates_presence_of :entrada, :salida

  # Métodos ficticios para que se puedan asignar las asociaciones polimórficas
  # mediante mass-assignment
  def build_entrada(atributos, opciones)
    self.entrada = polimorfica(:entrada).new(atributos)
  end
  def build_salida(atributos, opciones)
    self.salida = polimorfica(:salida).new(atributos)
  end

  private

    def polimorfica(tipo)
      case tipo
      when :entrada
        direccion == 'p->a' ? Producto : Actividad
      when :salida
        direccion == 'p->a' ? Actividad : Producto 
      end
    end

end
