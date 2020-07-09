require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_no_difference 'User.count' do
      # !! new Rails version, post method takes params. It's a hash that has a user, which is also a hash.
      # old version of Rails only took a user for post method
      post users_path, params: {
                        user: { 
                          name:   "",
                          email:  "user@invalid",
                          password:              "foo",
                          password_confirmation: "bar" 
                        }
                      }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do #raises error
      # Same as above, plus we don't use post_via_redirect anymore (depricated), instead 
      # we use post method and follow_redirect! at the end of the post method
      post users_path, params: {
                                      user: { 
                                        name:   "Example User",
                                        email:  "user@example.com",
                                        password:              "password",
                                        password_confirmation: "password" 
                                      }
                                    }
      follow_redirect!
    end
    assert_template 'users/show'
  end

end
