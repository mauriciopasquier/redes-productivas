# encoding: utf-8
require './test/test_helper'

class CadenasControllerTest < ActionController::TestCase

  test "debería acceder a la lista de cadenas" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cadenas)
  end

  test "debería ir a 'nuevo'" do
    get :new
    assert_response :success
  end

  test "debería crear una cadena" do
    assert_difference('Cadena.count') do
      post :create, cadena: attributes_for(:cadena)
    end

    assert_redirected_to cadena_path(assigns(:cadena))
  end

  test "debería mostrar una cadena" do
    get :show, id: create(:cadena).to_param
    assert_response :success
  end

  test "debería ir a editar" do
    get :edit, id: create(:cadena).to_param
    assert_response :success
  end

  test "debería actualizar una cadena" do
    put :update, id: create(:cadena).to_param, cadena: attributes_for(:cadena)

    assert_redirected_to cadena_path(assigns(:cadena))
  end

  test "debería eliminar una cadena" do
    cadena = create(:cadena)
    assert_difference('Cadena.count', -1) do
      delete :destroy, id: cadena.to_param
    end

    assert_redirected_to cadenas_path
  end

end
