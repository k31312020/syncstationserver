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

class PasswordValidatable
  include ActiveModel::Validations
  validates_with PasswordValidator, :attributes=>[:password]
  attr_accessor  :password
end

class PasswordValidatorTest < ActiveSupport::TestCase
  test "password should contain atleast 8 characters" do
    obj = PasswordValidatable.new
    obj.password = "passwOrd"
    assert_not obj.valid?, obj.errors.full_messages
  end

  test "password should contain atleast 1 number" do
    obj = PasswordValidatable.new
    obj.password = "passwOrdd"
    assert obj.valid?, obj.errors.full_messages
  end
end




 