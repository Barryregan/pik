require 'test_helper'

class ThemesTest < ActionDispatch::IntegrationTest
  
  def setup
    @photographer = Photographer.create!(togname: "barry", email: "bregan@testing.com")
    @theme = Theme.create(name: "night time street photography", description: "candid, from hip, no flash, 3200ISO", photographer: @photographer)
    @theme2 = @photographer.themes.build(name: "family portrait", description: "outdoors natual light candid")
    @theme2.save
  end
  
  test " get themes index" do
    get themes_path
    assert_response :success
  end
    
  test "get themes listing" do
    get themes_path
    assert_template 'themes/index'
    assert_match @theme.name, response.body
    assert_match @theme2.name, response.body
  end
  
end
