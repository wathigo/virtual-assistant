require 'rails_helper'

RSpec.describe User, type: :model do
  let(:cleo) { FactoryBot.build(:user) }
  let(:james) { FactoryBot.build(:user) }
  valid_emails = ['sampmle@yahoo.org', 'vin@example.com', 'shem@yahoo.ke', 'james@example.com']
  invalid_emails = ['vim.com', 'hello@hiiscom', 'samplegmailcom']

  describe 'General user attributes validations' do
    it 'should be valid' do
      assert cleo.valid?
    end

    it 'name should be present' do
      james.full_name = ''
      assert !james.valid?
      james.full_name = 'james'
      assert james.valid?
    end

    it 'Email should be present' do
      cleo.email = ''
      assert !cleo.valid?
      cleo.email = 'archer.@example.com'
      assert cleo.valid?
    end

    it 'Email format should be valid' do
      valid_emails.each do |email|
        cleo.email = email
        assert cleo.valid?
      end
      invalid_emails.each do |email|
        cleo.email = email
        assert !cleo.valid?
        expect(cleo.errors.full_messages[0]).to eql('Email is invalid')
      end
    end
  end
  describe 'devise specific attributes validations' do
    it 'should include the encrypted_password attribute' do
      expect(james.attributes).to include('encrypted_password')
    end

    it 'should include the reset_password_sent_at attribute' do
      expect(james.attributes).to include('reset_password_sent_at')
    end

    it 'should include the reset_password_token attribute' do
      expect(james.attributes).to include('reset_password_token')
    end

    it 'should include the remember_created_at attribute' do
      expect(james.attributes).to include('remember_created_at')
    end
  end
end
