# frozen_string_literal: true

require 'test_helper'

class AppTest < ActionDispatch::IntegrationTest

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
