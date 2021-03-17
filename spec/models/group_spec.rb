require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { Group.new }

  describe '#create_group' do
    it 'create a new group' do
      group.name = 'group name'
      group.icon = 'candy-cane'
      group.user_id = 1
      expect(group.save!).to eql(true)
    end
  end

  describe '#show_group' do
    it 'show a group and all its inversions ( false if there\'s not inversions on group)' do
      a = Inversion.in_a_group(2).nil?
      expect(a).to eql(false)
    end
  end

  describe '#select_options' do
    it 'take all options to icons on groups' do
      a = Group.select_options
      expect(a[0]).to eql(['select a group...', 0])
    end
  end
end
