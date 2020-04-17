require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { FactoryBot.build(:category) }
  describe 'General category attributes validations' do
    it 'should be valid' do
      assert service.valid?
    end

    it 'should not be valid' do
      service.name = ''
      assert !service.valid?
    end
  end
end
