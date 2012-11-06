class RelacionDecorator < Draper::Base
  decorates :relacion
  decorates_association :entrada, polymorphic: true
  decorates_association :salida, polymorphic: true

  def esquema
    "[ #{entrada.nombre} ] -> [ #{salida.nombre} ]"
  end

end
