require 'spec_helper'

RSpec.describe PasswordValidator, type: :validator do
    before(:each) do
        @validator = PasswordValidator.new({:attributes => {}})
        @mock = mock('model')
    end
    it 'should validate valid password' do 
        @validator.validate_each(@mock, 'password', 'pass')
    end
end