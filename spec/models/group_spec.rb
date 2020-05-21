require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:test_group) { Group.create(name: 'Group') }

  context 'validation' do
    it 'ensures name is present' do
      group = Group.new(icon: 'url').save
      expect(group).to eq(false)
    end

    it 'ensures name is unique' do
      group = Group.new(name: 'Group').save
      expect(group).to eq(false)
    end

    it 'ensures name is only allows letters and spaces' do
      group = Group.new(name: 'Group44').save
      expect(group).to eq(false)
    end
  end
end
