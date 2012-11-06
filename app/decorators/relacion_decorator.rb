class RelacionDecorator < Draper::Base
  decorates :relacion
  decorates_association :entrada, polymorphic: true
  decorates_association :salida, polymorphic: true

  def direccion
    "#{entrada.id_nodo.first}->#{salida.id_nodo.first}"
  end

end
