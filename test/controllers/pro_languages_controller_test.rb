require "test_helper"

class ProLanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pro_language = pro_languages(:one)
  end

  test "should get index" do
    get pro_languages_url, as: :json
    assert_response :success
  end

  test "should create pro_language" do
    assert_difference("ProLanguage.count") do
      post pro_languages_url, params: { pro_language: { creator: @pro_language.creator, name: @pro_language.name } }, as: :json
    end

    assert_response :created
  end

  test "should show pro_language" do
    get pro_language_url(@pro_language), as: :json
    assert_response :success
  end

  test "should update pro_language" do
    patch pro_language_url(@pro_language), params: { pro_language: { creator: @pro_language.creator, name: @pro_language.name } }, as: :json
    assert_response :success
  end

  test "should destroy pro_language" do
    assert_difference("ProLanguage.count", -1) do
      delete pro_language_url(@pro_language), as: :json
    end

    assert_response :no_content
  end
end
