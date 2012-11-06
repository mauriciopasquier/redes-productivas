require 'graphviz'

class CadenaDecorator < Draper::Base
  decorates :cadena
  decorates_association :relaciones

  def to_dot
    grafo = GraphViz.new(:G, type: :digraph)
    relaciones.each do |arista|
      a, b = arista.entrada, arista.salida
      grafo.add_edges a.id_nodo, b.id_nodo
      grafo.add_nodes a.id_nodo, label: a.label
      grafo.add_nodes b.id_nodo, label: b.label
    end
    grafo.output dot: String
  end

  def preparada
    if relaciones.empty?
      relaciones.build(
        entrada: Actividad.new(nombre: 'nueva'),
        salida: Producto.new(nombre: 'nuevo'))
    end
    self
  end

end
