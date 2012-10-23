# encoding: utf-8
require './test/test_helper'

class ActividadesControllerTest < ActionController::TestCase

  test "debería acceder a la lista de actividades" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actividades)
  end

  test "debería ir a 'nuevo'" do
    get :new
    assert_response :success
  end

  test "debería crear una actividad" do
    assert_difference('Actividad.count') do
      post :create, actividad: attributes_for(:actividad)
    end

    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "debería mostrar una actividad" do
    get :show, id: create(:actividad).to_param
    assert_response :success
  end

  test "debería ir a 'editar'" do
    get :edit, id: create(:actividad).to_param
    assert_response :success
  end

  test "debería actualizar una actividad" do
    put :update, id: create(:actividad).to_param, actividad: attributes_for(:actividad)

    assert_redirected_to actividad_path(assigns(:actividad))
  end

  test "debería eliminar una actividad" do
    actividad = create(:actividad)
    assert_difference('Actividad.count', -1) do
      delete :destroy, id: actividad.to_param
    end

    assert_redirected_to actividades_path
  end

end
