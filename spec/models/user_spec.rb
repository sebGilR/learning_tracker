require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:test_user) { User.create(name: 'Tom', username: 'tom') }
  let!(:session1) { test_user.sessions.create(name: 'First', amount: 5) }
  let!(:session2) { test_user.sessions.create(name: 'Second', amount: 3) }
  let!(:session3) { test_user.sessions.create(name: 'Session', amount: 3) }
  let!(:group) { Group.create(name: 'Group', icon: '') }

  context 'validation' do
    it 'ensures name is present' do
      user = User.new(username: 'User').save
      expect(user).to eq(false)
    end

    it 'ensures username is present' do
      user = User.new(name: 'User').save
      expect(user).to eq(false)
    end

    it 'ensures username has only letters' do
      user = User.new(name: 'User', username: '4user').save
      expect(user).to eq(false)
    end

    it 'ensures username is between 2 and 10 characters' do
      user = User.new(name: 'User', username: 'u').save
      expect(user).to eq(false)
    end

    it 'ensures username is unique' do
      user2 = User.new(name: 'User', username: 'tom').save

      expect(user2).to eq(false)
    end
  end

  describe '#recent' do
    it 'returns a collection of the last 5 sessions' do
      session4 = test_user.sessions.create(name: 'Session', amount: 3)
      session5 = test_user.sessions.create(name: 'Session', amount: 3)
      session6 = test_user.sessions.create(name: 'Session', amount: 3)
      group.sessions << session1
      group.sessions << session2
      group.sessions << session3
      group.sessions << session4
      group.sessions << session5
      group.sessions << session6
      expect(test_user.recent.length).to eq(5)
    end
  end

  describe '#my_sessions' do
    it 'returns a collection of grouped sessions' do
      group.sessions << session1
      group.sessions << session2
      expect(test_user.my_sessions.length).to eq(2)
    end
  end

  describe '#my_sessions_total' do
    it 'returns the sum of amount attributes of all grouped sessions' do
      group.sessions << session1
      group.sessions << session2
      expect(test_user.my_sessions_total).to eq(8)
    end
  end

  describe '#ext_sessions' do
    it 'returns a collection of grouped sessions' do
      group.sessions << session1
      group.sessions << session2
      expect(test_user.ext_sessions.length).to eq(1)
    end
  end

  describe '#ext_sessions_total' do
    it 'returns the sum of amount attributes of all grouped sessions' do
      group.sessions << session1
      group.sessions << session2
      expect(test_user.ext_sessions_total).to eq(3)
    end
  end
end
