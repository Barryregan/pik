require 'test_helper'

class ThemeTest < ActiveSupport::TestCase
    
    def setup
       @theme = Theme.new(name: "Portrait", description: "hi-key Summer outdoors")
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