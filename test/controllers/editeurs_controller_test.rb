require 'test_helper'

class EditeursControllerTest < ActionController::TestCase
  setup do
    @editeur = editeurs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:editeurs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create editeur" do
    assert_difference('Editeur.count') do
      post :create, editeur: { email: @editeur.email, password_digest: @editeur.password_digest, username: @editeur.username }
    end

    assert_redirected_to editeur_path(assigns(:editeur))
  end

  test "should show editeur" do
    get :show, id: @editeur
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @editeur
    assert_response :success
  end

  test "should update editeur" do
    patch :update, id: @editeur, editeur: { email: @editeur.email, password_digest: @editeur.password_digest, username: @editeur.username }
    assert_redirected_to editeur_path(assigns(:editeur))
  end

  test "should destroy editeur" do
    assert_difference('Editeur.count', -1) do
      delete :destroy, id: @editeur
    end

    assert_redirected_to editeurs_path
  end
end
