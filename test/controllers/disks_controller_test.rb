require "test_helper"

class DisksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disk = disks(:one)
  end

  test "should get index" do
    get disks_url, as: :json
    assert_response :success
  end

  test "should create disk" do
    assert_difference('Disk.count') do
      post disks_url, params: { disk: { name: @disk.name, songs: @disk.songs } }, as: :json
    end

    assert_response 201
  end

  test "should show disk" do
    get disk_url(@disk), as: :json
    assert_response :success
  end

  test "should update disk" do
    patch disk_url(@disk), params: { disk: { name: @disk.name, songs: @disk.songs } }, as: :json
    assert_response 200
  end

  test "should destroy disk" do
    assert_difference('Disk.count', -1) do
      delete disk_url(@disk), as: :json
    end

    assert_response 204
  end
end
