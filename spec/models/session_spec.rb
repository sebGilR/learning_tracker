require 'rails_helper'

RSpec.describe Session, type: :model do
  let!(:test_user) { User.create(name: 'Tom', username: 'tom') }
  let!(:session1) { test_user.sessions.create(name: 'Session', amount: 5) }
  let!(:session2) { test_user.sessions.create(name: 'Session', amount: 3) }
  let!(:session3) { test_user.sessions.create(name: 'Session', amount: 3) }
  let!(:group) { Group.create(name: 'Group', icon: '') }

  context 'validation' do
    it 'ensures name is present' do
      session = test_user.sessions.build(amount: 3).save
      expect(session).to eq(false)
    end

    it 'ensures name is maximum 30 characters' do
      session = test_user.sessions.build(name: 'thisisaninvalidnamethisisaninvalidname', amount: 3).save
      expect(session).to eq(false)
    end

    it 'ensures name only has letters and spaces' do
      session = test_user.sessions.build(name: 'Notvalid 444', amount: 3).save
      expect(session).to eq(false)
    end

    it 'ensures amount is present' do
      session = test_user.sessions.build(name: 'Session').save
      expect(session).to eq(false)
    end

    it 'ensures amount is numeric' do
      session = test_user.sessions.build(name: 'Session', amount: 'car').save
      expect(session).to eq(false)
    end

    it 'ensures amount is integer' do
      session = test_user.sessions.build(name: 'Session', amount: 1.4).save
      expect(session).to eq(false)
    end
  end

  describe 'group' do
    it 'returns the group the session is part of' do
      group.sessions << session1
      expect(session1.group).to be_a(Group)
    end
  end

  describe 'group=' do
    it 'sets the group for a given session' do
      group_name = group.name
      session1.group = group_name
      expect(session1.group).to be_a(Group)
    end
  end
end
