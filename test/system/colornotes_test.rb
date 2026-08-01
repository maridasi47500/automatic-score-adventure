require "application_system_test_case"

class ColornotesTest < ApplicationSystemTestCase
  setup do
    @colornote = colornotes(:one)
  end

  test "visiting the index" do
    visit colornotes_url
    assert_selector "h1", text: "Colornotes"
  end

  test "should create colornote" do
    visit colornotes_url
    click_on "New colornote"

    fill_in "Alteration", with: @colornote.alteration
    fill_in "Color", with: @colornote.color_id
    fill_in "Degreenote", with: @colornote.degreenote
    fill_in "Score", with: @colornote.score_id
    click_on "Create Colornote"

    assert_text "Colornote was successfully created"
    click_on "Back"
  end

  test "should update Colornote" do
    visit colornote_url(@colornote)
    click_on "Edit this colornote", match: :first

    fill_in "Alteration", with: @colornote.alteration
    fill_in "Color", with: @colornote.color_id
    fill_in "Degreenote", with: @colornote.degreenote
    fill_in "Score", with: @colornote.score_id
    click_on "Update Colornote"

    assert_text "Colornote was successfully updated"
    click_on "Back"
  end

  test "should destroy Colornote" do
    visit colornote_url(@colornote)
    click_on "Destroy this colornote", match: :first

    assert_text "Colornote was successfully destroyed"
  end
end
