require 'test_helper'

class OenologistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @oenologist = oenologists(:one)
  end

  test "should get index" do
    get oenologists_url
    assert_response :success
  end

  test "should get new" do
    get new_oenologist_url
    assert_response :success
  end

  test "should create oenologist" do
    assert_difference('Oenologist.count') do
      post oenologists_url, params: { oenologist: { age: @oenologist.age, name: @oenologist.name, nationality: @oenologist.nationality } }
    end

    assert_redirected_to oenologist_url(Oenologist.last)
  end

  test "should show oenologist" do
    get oenologist_url(@oenologist)
    assert_response :success
  end

  test "should get edit" do
    get edit_oenologist_url(@oenologist)
    assert_response :success
  end

  test "should update oenologist" do
    patch oenologist_url(@oenologist), params: { oenologist: { age: @oenologist.age, name: @oenologist.name, nationality: @oenologist.nationality } }
    assert_redirected_to oenologist_url(@oenologist)
  end

  test "should destroy oenologist" do
    assert_difference('Oenologist.count', -1) do
      delete oenologist_url(@oenologist)
    end

    assert_redirected_to oenologists_url
  end
end
