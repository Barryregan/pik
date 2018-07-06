require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
    
    def setup
       @photographer = Photographer.create!(togname: "barryregan", email: "barry@example.com",
                                            password: "password", password_confirmation: "password" )
       @theme = @photographer.themes.build(name: "Portrait", description: "hi-key Summer outdoors")
    end
    
    test "theme without photographer should be invalid" do
        @theme.photographer_id = nil
        assert_not @theme.valid?
    end
    
    test "theme should be valid" do
        assert @theme.valid?
    end
    
    test "name should be present" do
        @theme.name = " "
        assert_not @theme.valid?
    end
    
     test "description should be present" do
        @theme.description = " "
        assert_not @theme.valid?
    end
    
    test "description shouldn't be less than 5 characters" do
        @theme.description = "a"*3
        assert_not @theme.valid?
        
    end
    
    test "description shouldn't be more than 750 characters" do
        @theme.description = "a"*751
        assert_not @theme.valid?
    
    end
end