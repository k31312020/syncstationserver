require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should have an email" do
    user = User.new(password: "passWord@11", password_confirmation: "passWord@11")
    assert user.errors[:email], user.errors.full_messages
  end

  test "should have a password" do
    user = User.new(email: "test")
    assert user.errors[:password], user.errors.full_messages
  end

  test "should have a valid email" do
    user = User.new(email: "test", password: "passWord@11", password_confirmation: "passWord@11")
    assert user.errors[:email], user.errors.full_messages
  end

  test "should have password confirmation" do
    user = User.new(email: "test", password: "passWord@11")
    assert user.errors[:password_confirmation], user.errors.full_messages
  end

  test "password and password confirmation should match" do
    user = User.new(email: "test", password: "passWord@11", password_confirmation: "test@11")
    assert user.errors[:password], user.errors.full_messages
  end

  test "does not accept invalid password" do
    user = User.new(email: "test", password: "pass", password_confirmation: "pass")
    assert user.errors[:password], user.errors.full_messages
  end
end
 