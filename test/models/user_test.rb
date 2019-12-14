require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'add user' do
    User.create name: 'test', email: 'test@test.test', password: 'test'
    assert_not_nil User.where(name: 'test')
  end

  test 'test validations' do
    user = User.new
    user.name = 'lol'
    user.email = 'lol'
    user.password_digest = 'lol'
    assert_equal user.save, false
  end

  test 'should not be kept empty or with one empty field' do
    assert User.create(name: nil, email: 't@t.ru', password_digest:
        '1').invalid?, '1'
    assert User.create(name: 't', email: nil, password_digest: '1').invalid?,
           '2'
    assert User.create(name: 't', email: 't@t.ru', password_digest:
        nil).invalid?, '3'
    assert User.create(name: nil, email: nil, password_digest: '1').invalid?,
           '4'
    assert User.create(name: nil, email: 't@t.ru', password_digest:
        nil).invalid?, '5'
    assert User.create(name: 't', email: nil, password_digest: nil).invalid?,
           '6'
    assert User.create(name: nil, email: nil, password_digest: nil).invalid?,
           '7'
  end
  test 'with correctly filled in fields should be saved' do
    assert User.create(name: 't', email: 't', password_digest: '1').invalid?,
           '1'
    assert User.create(name: 't', email: 't@t.ru', password_digest: '1').valid?,
           '2'
  end

  test 'with a non-unique name or mail should not be saved' do
    assert User.create(name: 't', email: 't@t.ru', password_digest: '1').valid?,
           '1'
    assert User.create(name: 'r', email: 't@t.ru', password_digest:
        '1').invalid?, '2'
    assert User.create(name: 't', email: 'y@y.ru', password_digest:
        '1').invalid?, '3'
  end

  test 'search in db' do
    assert User.create(name: 't', email: 't@t.ru', password_digest: '1').valid?,
           '1'
    assert User.find_by_email('t@t.ru'), '2'
    assert User.find_by_name('t'), '3'
  end
end
