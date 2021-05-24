require 'test_helper'

class FriendsAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friends_attachment = friends_attachments(:one)
  end

  test "should get index" do
    get friends_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_friends_attachment_url
    assert_response :success
  end

  test "should create friends_attachment" do
    assert_difference('FriendsAttachment.count') do
      post friends_attachments_url, params: { friends_attachment: { avatar: @friends_attachment.avatar, friend_id: @friends_attachment.friend_id } }
    end

    assert_redirected_to friends_attachment_url(FriendsAttachment.last)
  end

  test "should show friends_attachment" do
    get friends_attachment_url(@friends_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_friends_attachment_url(@friends_attachment)
    assert_response :success
  end

  test "should update friends_attachment" do
    patch friends_attachment_url(@friends_attachment), params: { friends_attachment: { avatar: @friends_attachment.avatar, friend_id: @friends_attachment.friend_id } }
    assert_redirected_to friends_attachment_url(@friends_attachment)
  end

  test "should destroy friends_attachment" do
    assert_difference('FriendsAttachment.count', -1) do
      delete friends_attachment_url(@friends_attachment)
    end

    assert_redirected_to friends_attachments_url
  end
end
