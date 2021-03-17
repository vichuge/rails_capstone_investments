require 'rails_helper'

RSpec.describe Inversion, type: :model do
  let(:inversion) { Inversion.new }

  describe '#create_inversion' do
    it 'create a new group' do
      inversion.name = 'inversion name'
      inversion.amount = 152.15
      inversion.author_id = 1
      expect(inversion.save).to eql(true)
    end

    it 'create a new group' do
      inversion.name = 'inversion name'
      inversion.amount = 152.15
      expect(inversion.save).to eql(false)
    end
  end

  describe '#total_amount' do
    it 'show the total inversion amount to a user' do
      a = Inversion.total(1)
      expect(a.nil?).to eql(false)
    end

    it 'show the total inversion amount to a user who doesn\'t exist' do
      a = Inversion.total(9_999_999_999_999_999_999_999_999)
      expect(a).to eql(0.0)
    end
  end

  describe '#external_inversions' do
    it 'show all the inversions to a user without any group' do
      a = Inversion.externals(1)
      expect(a.nil?).to eql(false)
    end
  end
end
