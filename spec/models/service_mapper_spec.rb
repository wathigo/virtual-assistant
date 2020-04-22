# rubocop:disable Lint/ParenthesesAsGroupedExpression

require 'rails_helper'

RSpec.describe ServiceMapper, type: :model do
  let (:employee) { FactoryBot.create(:user) }
  let (:client) { FactoryBot.create(:user) }
  let (:service) { FactoryBot.create(:service) }

  let (:mapper) { FactoryBot.create(:service_mapper, employee_id: employee.id, client_id: client.id, service_id: service.id) }

  # rubocop:enable Lint/ParenthesesAsGroupedExpression
  describe 'General Service_mapper attributes validation' do
    it 'Record should be valid if all the validations passes' do
      expect(mapper.valid?).to eql(true)
    end

    it 'Validates the presence of employee' do
      mapper.employee_id = ''
      expect(mapper.valid?).to eql(false)
    end

    it 'Validates the presence of client' do
      mapper.client_id = ''
      expect(mapper.valid?).to eql(false)
    end
  end
end
