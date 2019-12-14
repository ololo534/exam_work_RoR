require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'user should add to db' do
    post '/user', params: { user: { name: 'google',
                                    email: 'google@google.com',
                                    password: 'google',
                                    password_confirmation: 'google' } }
    assert_redirected_to '/main'
    assert User.find_by_name('google')
  end
end
