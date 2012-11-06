# encoding: utf-8
module CadenasHelper

  def relacion_preparada
    entrada, salida = entrada_salida
    Relacion.new(entrada: entrada, salida: salida)
  end

  def entrada_salida
    case params[:direccion]
      when 'a->p' then  [Actividad.new, Producto.new]
      else              [Producto.new, Actividad.new]
    end
  end

end
