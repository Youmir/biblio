require 'test_helper'

class LivresEmpruntesControllerTest < ActionController::TestCase
  setup do
    @livres_emprunte = livres_empruntes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:livres_empruntes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create livres_emprunte" do
    assert_difference('LivresEmprunte.count') do
      post :create, livres_emprunte: { adherent_id: @livres_emprunte.adherent_id, livre_id: @livres_emprunte.livre_id }
    end

    assert_redirected_to livres_emprunte_path(assigns(:livres_emprunte))
  end

  test "should show livres_emprunte" do
    get :show, id: @livres_emprunte
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @livres_emprunte
    assert_response :success
  end

  test "should update livres_emprunte" do
    patch :update, id: @livres_emprunte, livres_emprunte: { adherent_id: @livres_emprunte.adherent_id, livre_id: @livres_emprunte.livre_id }
    assert_redirected_to livres_emprunte_path(assigns(:livres_emprunte))
  end

  test "should destroy livres_emprunte" do
    assert_difference('LivresEmprunte.count', -1) do
      delete :destroy, id: @livres_emprunte
    end

    assert_redirected_to livres_empruntes_path
  end
end
