require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "session should'n be created" do
    post '/login', params: { email: 'admin@admin.ru', password: '123' }
    assert session[:user_id].nil?
  end

  test "session should be created" do
    post '/user', params: { user: { name: 'google',
                                    email: 'google@google.com',
                                    password: 'google',
                                    password_confirmation: 'google' } }
    assert !session[:user_id].nil?
    assert (get '/logout'), :success
    assert (get '/login'), :success
    post '/login', params: { username: 'google', password: 'google' }
    assert_redirected_to '/main'
    assert !session[:user_id].nil?
  end
end
