require 'test_helper'

class PhotographersShowTest < ActionDispatch::IntegrationTest

  def setup
    @photographer = Photographer.create!(togname: "barry", email: "bregan@testing.com",password: "password", password_confirmation: "password")
    @theme = Theme.create(name: "nighttime photography", description: "candid, from hip, no flash, 3200ISO", photographer: @photographer)
    @theme2 = @photographer.themes.build(name: "family portrait", description: "outdoors natual light candid")
    @theme2.save
  end
  
   test "get photographers show" do
    get photographer_path(@photographer)
    assert_template 'photographers/show'
    assert_select 'a[href=?]', theme_path(@theme), text: @theme.name
    assert_select 'a[href=?]', theme_path(@theme2), text: @theme2.name
    assert_match @theme.description, response.body
    assert_match @theme2.description, response.body
    assert_match @photographer.togname, response.body
  end
end
