require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create_user' do
    it 'create a new user with name \'test rspec\'' do
      expect(User.create!(username: "test rspec").username).to eql('test rspec')
    end
  end
end
