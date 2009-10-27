require 'test_helper'

class MemberSessionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    MemberSession.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    MemberSession.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to root_url
  end
  
  def test_destroy
    member_session = MemberSession.first
    delete :destroy, :id => member_session
    assert_redirected_to root_url
    assert !MemberSession.exists?(member_session.id)
  end
end
