require 'rails_helper'

RSpec.describe Group, type: :model do
  describe '#create_group' do
    it 'create a new group' do
      group = Group.new(name: 'group name')
      group.icon = 'candy-cane'
      group.user_id = 1
      expect(group.save!).to eql(true)
    end
  end
end
