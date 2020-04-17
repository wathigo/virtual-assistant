require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:cat) { FactoryBot.build(:category) }
  describe 'General category attributes validations' do
    it 'should be valid' do
      assert cat.valid?
    end

    it 'should not be valid' do
      cat.name = ''
      assert !cat.valid?
    end
  end
end
