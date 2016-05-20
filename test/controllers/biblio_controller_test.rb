require 'test_helper'

class BiblioControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get emprunter" do
    get :emprunter
    assert_response :success
  end

  test "should get rendre" do
    get :rendre
    assert_response :success
  end

  test "should get list_emprunts" do
    get :list_emprunts
    assert_response :success
  end

end
