require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  describe '#current_user' do
    it 'check the user id logged in page' do
      user = User.find_by(username: 'test 1')
      session[:user_id] = user.id
      session[:username] = user.username
      expect(current_user).to eql(1)
    end
  end

  describe '#logged_user?' do
    it 'check if exist a session created' do
      user = User.find_by(username: 'test 1')
      session[:user_id] = user.id
      session[:username] = user.username
      expect(logged_user?).to eql(true)
    end

    it 'check if doesn\'t exist a session created' do
      expect(logged_user?).to eql(false)
    end
  end
end
