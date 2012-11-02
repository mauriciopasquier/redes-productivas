# encoding: utf-8
require './test/test_helper'

class RelacionTest < ActiveSupport::TestCase

  test 'la fábrica debería devolver asociaciones correctas' do
    producto_actividad = create(:relacion_producto_actividad)
    actividad_producto = create(:relacion_actividad_producto)

    assert_not_nil producto_actividad.entrada, "No le asignó un producto"
    assert_not_nil producto_actividad.salida, "No le asignó una actividad"
    assert_instance_of Producto,  producto_actividad.entrada
    assert_instance_of Actividad, producto_actividad.salida

    assert_not_nil actividad_producto.entrada, "No le asignó una actividad"
    assert_not_nil actividad_producto.salida, "No le asignó un producto"
    assert_instance_of Actividad, actividad_producto.entrada
    assert_instance_of Producto,  actividad_producto.salida
  end

end
