# encoding: utf-8
require './test/test_helper'

class ProductosControllerTest < ActionController::TestCase

  test "debería acceder a la lista de productos" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productos)
  end

  test "debería ir a 'nuevo'" do
    get :new
    assert_response :success
  end

  test "debería crear un producto" do
    assert_difference('Producto.count') do
      post :create, producto: attributes_for(:producto)
    end

    assert_redirected_to producto_path(assigns(:producto))
  end

  test "debería mostrar un producto" do
    get :show, id: create(:producto).to_param
    assert_response :success
  end

  test "debería ir a 'editar'" do
    get :edit, id: create(:producto).to_param
    assert_response :success
  end

  test "debería actualizar un producto" do
    put :update, id: create(:producto).to_param, producto: attributes_for(:producto)

    assert_redirected_to producto_path(assigns(:producto))
  end

  test "debería eliminar un producto" do
    producto = create(:producto)
    assert_difference('Producto.count', -1) do
      delete :destroy, id: producto.to_param
    end

    assert_redirected_to productos_path
  end

end
