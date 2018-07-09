require 'test_helper'

class ThemesDeleteTest < ActionDispatch::IntegrationTest
 
  def setup
    @photographer = Photographer.create!(togname: "barry", email: "bregan@testing.com", password: "password", password_confirmation: "password")
    @theme = Theme.create(name: "nighttime photography", description: "candid, from hip, no flash, 3200ISO", photographer: @photographer)
  end
  
  test "dlete theme success" do
    sign_in_as(@photographer, "password")
    get theme_path(@theme)
    assert_template 'themes/show'
    assert_select 'a[href=?]', theme_path(@theme), text: "Delete this theme"
    assert_difference 'Theme.count', -1 do
      delete theme_path(@theme)
    end
    assert_redirected_to themes_path
    assert_not flash.empty?
  end
end
