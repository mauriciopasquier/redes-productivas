require 'graphviz'

class CadenaDecorator < Draper::Base
  decorates :cadena
  decorates_association :relaciones

  def grafo(formato = nil)
    grafo = GraphViz.new(nombre, type: :digraph)
    relaciones.each do |arista|
      a, b = arista.entrada, arista.salida
      grafo.add_edges a.id_nodo, b.id_nodo
      grafo.add_nodes a.id_nodo, label: a.label
      grafo.add_nodes b.id_nodo, label: b.label
    end

    if formato.present?
      grafo.output(formato => String)
    else
      GraphViz.parse_string grafo.output(dot: String)
    end
  end

  def relacion
    RelacionDecorator.new(
      Relacion.new( entrada: Actividad.new,
                    salida: Actividad.new ) )
  end

end
