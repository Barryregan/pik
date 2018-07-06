require 'test_helper'

class PhotographerTest < ActiveSupport::TestCase
    
    def setup
       @photographer = Photographer.new(togname: "IconPhoto", email:"mail@example.com",
                                        password: "password", password_confirmation: "password")
    end
    
    test "Photographer should be valid" do
        assert @photographer.valid?
    end
    
    test"name should be present" do
        @photographer.togname = " "
        assert_not @photographer.valid?
    end
    
    test "name should be less than 30 characters" do
        @photographer.togname = "a"*31
        assert_not @photographer.valid?
    end
    
    test "email should be present" do
        @photographer.email = " "
        assert_not @photographer.valid?
    end
    
    test "email should not exceed 255" do
        @photographer.email = "a"*245+"@example.com"
        assert_not @photographer.valid?
    end
    
    test "email should be correct format" do
        valid_emails = %w[user@example.com BREGAN@gmail.com M.first@yahoo.ca john+smith@co.uk.org]
        valid_emails.each do |valids|
            @photographer.email = valids
            assert @photographer.valid?, "#{valids.inspect} should be valid"
        end
    end
    
    test "should reject invalid addresses" do
        invalid_emails = %w[barry@example regan@example,com bregan.name@gmail. barry@bar+foo.com]
        invalid_emails.each do |invalids|
            @photographer.email = invalids
            assert_not @photographer.valid?, "#{invalids.inspect} should be invalid"
        end
    end
    
    test "email  unique /  case insensitive" do
        duplicate_tog = @photographer.dup
        duplicate_tog.email = @photographer.email.upcase
        @photographer.save
        assert_not duplicate_tog.valid?
    end
     
    test "email should be transformed to lowercase" do
        mixed_email = "JohN@ExampLe.com"
        @photographer.email = mixed_email
        @photographer.save
        assert_equal mixed_email.downcase, @photographer.reload.email 
    end
    
    test "password present" do
        @photographer.password = @photographer.password_confirmation = " "
        assert_not @photographer.valid?
    end
    
    test "password min 5 characters" do
        @photographer.password = @photographer.password_confirmation = "x"*4
        assert_not @photographer.valid?
    end
  
end

