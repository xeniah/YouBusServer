require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Trips.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Trips.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Trips.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to trips_url(assigns(:trips))
  end

  def test_edit
    get :edit, :id => Trips.first
    assert_template 'edit'
  end

  def test_update_invalid
    Trips.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Trips.first
    assert_template 'edit'
  end

  def test_update_valid
    Trips.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Trips.first
    assert_redirected_to trips_url(assigns(:trips))
  end

  def test_destroy
    trips = Trips.first
    delete :destroy, :id => trips
    assert_redirected_to trips_url
    assert !Trips.exists?(trips.id)
  end
end
