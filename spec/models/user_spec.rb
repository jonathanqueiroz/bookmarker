# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # ...

  describe '#authenticate' do
    let(:user) do
      create(:user, email: 'user@duetcode.io', password: 'sample')
    end

    it 'returns user when the credentials are correct' do
      expect(User.authenticate(user.email, user.password)).to eq(user)
    end

    it 'returns nil when the credentials are not correct' do
      expect(User.authenticate(user.email, 'wrong')).to be_nil
    end
  end
end
