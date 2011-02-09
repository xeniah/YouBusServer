require 'test_helper'

class CheckinsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Checkins.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Checkins.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Checkins.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to checkins_url(assigns(:checkins))
  end

  def test_edit
    get :edit, :id => Checkins.first
    assert_template 'edit'
  end

  def test_update_invalid
    Checkins.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Checkins.first
    assert_template 'edit'
  end

  def test_update_valid
    Checkins.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Checkins.first
    assert_redirected_to checkins_url(assigns(:checkins))
  end

  def test_destroy
    checkins = Checkins.first
    delete :destroy, :id => checkins
    assert_redirected_to checkins_url
    assert !Checkins.exists?(checkins.id)
  end
end
