# encoding: utf-8
require './test/test_helper'

class CadenaTest < ActiveSupport::TestCase

  test 'la fábrica debería devolver asociaciones correctas' do
    assert create(:cadena).relaciones.empty?
    assert_instance_of  Relacion,
                        create(:cadena_con_relaciones).relaciones.first
  end

end 
