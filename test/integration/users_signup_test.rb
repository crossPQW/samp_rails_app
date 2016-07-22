require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'invalid signup inforamtion' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                              email: "user@invalid",
                            password: "foo",
               password_confirmation: "bar"}
    end
    assert_template 'users/new'
  end

  test 'valid signup information' do
    get signup_path
    name = "huangshaohua"
    email= "huangshaohua@qq.com"
    password = "zxcvbnm"
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: name,
                                    email: email,
                                    password: password,
                                    password_confirmation: password }
    end
  end
end
