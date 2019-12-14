require 'test_helper'

class AllRecipeControllerTest < ActionDispatch::IntegrationTest
  test 'can open all_recipe if sing up' do
    post '/user', params: { user: { name: 'google',
                                    email: 'google@google.com',
                                    password: 'google',
                                    password_confirmation: 'google' } }
    assert_redirected_to '/main'
    assert (get '/all_recipe'), :success
  end

  test 'can open recipe #1 if sing up' do
    post '/user', params: { user: { name: 'google',
                                    email: 'google@google.com',
                                    password: 'google',
                                    password_confirmation: 'google' } }
    assert_redirected_to '/main'
    assert (get '/all_recipe/?1'), :success
  end
end
