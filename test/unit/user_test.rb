require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'reserved usernames' do
    %w{admin kyle leo}.each do |username|
      user = User.create(email: 'test@example.com', username: username, password: 'foobar')
      assert user.new_record?
      assert_equal ['is not allowed'], user.errors[:username]
    end
  end
end
