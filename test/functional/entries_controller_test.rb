require File.dirname(__FILE__) + '/../test_helper'
require 'entries_controller'

# Re-raise errors caught by the controller.
class EntriesController; def rescue_action(e) raise e end; end

class EntriesControllerTest < Test::Unit::TestCase
  fixtures :entries

  def setup
    @controller = EntriesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_get_index
    get :index
    assert_response :success
    assert assigns(:entries)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end
  
  def test_should_create_entry
    old_count = Entry.count
    post :create, :entry => { }
    assert_equal old_count+1, Entry.count
    
    assert_redirected_to entry_path(assigns(:entry))
  end

  def test_should_show_entry
    get :show, :id => 1
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => 1
    assert_response :success
  end
  
  def test_should_update_entry
    put :update, :id => 1, :entry => { }
    assert_redirected_to entry_path(assigns(:entry))
  end
  
  def test_should_destroy_entry
    old_count = Entry.count
    delete :destroy, :id => 1
    assert_equal old_count-1, Entry.count
    
    assert_redirected_to entries_path
  end
end
