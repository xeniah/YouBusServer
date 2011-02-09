require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Route.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Route.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Route.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to route_url(assigns(:route))
  end

  def test_edit
    get :edit, :id => Route.first
    assert_template 'edit'
  end

  def test_update_invalid
    Route.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Route.first
    assert_template 'edit'
  end

  def test_update_valid
    Route.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Route.first
    assert_redirected_to route_url(assigns(:route))
  end

  def test_destroy
    route = Route.first
    delete :destroy, :id => route
    assert_redirected_to routes_url
    assert !Route.exists?(route.id)
  end
end
