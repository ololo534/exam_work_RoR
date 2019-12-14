require 'test_helper'

class AppTest < ActionDispatch::IntegrationTest
  test 'normal search if user sing in' do
    post '/user', params: { user: { name: 'google',
                                    email: 'google@google.com',
                                    password: 'google',
                                    password_confirmation: 'google' } }
    assert_redirected_to '/main'
    assert (get '/search'), :success
    # get search_ajax_path(id_1: 1, id_2: 3), xhr: true
    # assert_response :success
    # content = '<tr> <td>Сырники</td> <td> 30 мин. </td> </tr>'
    # assert response.body.include?(content)
  end

  test 'should not get page if not authenticated' do
    get '/main'
    assert_redirected_to '/login'
    get '/all_recipe'
    assert_redirected_to '/login'
    get '/contact'
    assert_redirected_to '/login'
    get '/search'
    assert_redirected_to '/login'
  end
  test 'should get page if not authenticated' do
    assert (get '/login'), :success
    assert (get '/signup'), :success
  end
end
