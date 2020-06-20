require 'test_helper'

class CatchCopiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @catch_copy = catch_copies(:one)
  end

  test "should get index" do
    get catch_copies_url
    assert_response :success
  end

  test "should get new" do
    get new_catch_copy_url
    assert_response :success
  end

  test "should create catch_copy" do
    assert_difference('CatchCopy.count') do
      post catch_copies_url, params: { catch_copy: { image: @catch_copy.image, job_category: @catch_copy.job_category, target: @catch_copy.target, title: @catch_copy.title, user_id: @catch_copy.user_id } }
    end

    assert_redirected_to catch_copy_url(CatchCopy.last)
  end

  test "should show catch_copy" do
    get catch_copy_url(@catch_copy)
    assert_response :success
  end

  test "should get edit" do
    get edit_catch_copy_url(@catch_copy)
    assert_response :success
  end

  test "should update catch_copy" do
    patch catch_copy_url(@catch_copy), params: { catch_copy: { image: @catch_copy.image, job_category: @catch_copy.job_category, target: @catch_copy.target, title: @catch_copy.title, user_id: @catch_copy.user_id } }
    assert_redirected_to catch_copy_url(@catch_copy)
  end

  test "should destroy catch_copy" do
    assert_difference('CatchCopy.count', -1) do
      delete catch_copy_url(@catch_copy)
    end

    assert_redirected_to catch_copies_url
  end
end
