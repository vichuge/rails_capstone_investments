require 'rails_helper'

RSpec.describe Inversion, type: :model do
  describe '#create_inversion' do
    it 'create a new group' do
      inv = Inversion.new(name: 'inversion name')
      inv.amount = 152.55
      inv.author_id = 1
      expect(inv.save!).to eql(true)
    end
  end
end
