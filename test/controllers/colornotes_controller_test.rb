require "test_helper"

class ColornotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @colornote = colornotes(:one)
  end

  test "should get index" do
    get colornotes_url
    assert_response :success
  end

  test "should get new" do
    get new_colornote_url
    assert_response :success
  end

  test "should create colornote" do
    assert_difference("Colornote.count") do
      post colornotes_url, params: { colornote: { alteration: @colornote.alteration, color_id: @colornote.color_id, degreenote: @colornote.degreenote, score_id: @colornote.score_id } }
    end

    assert_redirected_to colornote_url(Colornote.last)
  end

  test "should show colornote" do
    get colornote_url(@colornote)
    assert_response :success
  end

  test "should get edit" do
    get edit_colornote_url(@colornote)
    assert_response :success
  end

  test "should update colornote" do
    patch colornote_url(@colornote), params: { colornote: { alteration: @colornote.alteration, color_id: @colornote.color_id, degreenote: @colornote.degreenote, score_id: @colornote.score_id } }
    assert_redirected_to colornote_url(@colornote)
  end

  test "should destroy colornote" do
    assert_difference("Colornote.count", -1) do
      delete colornote_url(@colornote)
    end

    assert_redirected_to colornotes_url
  end
end
