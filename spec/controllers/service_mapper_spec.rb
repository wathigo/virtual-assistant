# rubocop:disable Lint/ParenthesesAsGroupedExpression
# rubocop:disable Layout/LineLength
require 'rails_helper'

RSpec.describe ServiceMappersController, type: :controller do
  let (:employee) { FactoryBot.create(:user) }
  let (:client) { FactoryBot.create(:user) }
  let (:service) { FactoryBot.create(:service) }

  let (:mapper) { FactoryBot.create(:service_mapper, employee_id: employee.id, client_id: client.id, service_id: service.id) }

  # rubocop:enable Lint/ParenthesesAsGroupedExpression
  describe '#create' do
    it 'Increases created service_mapper by one if the record is valid' do
      service_mapper_params = {
        service_id: service.id,
        employee_id: employee.id,
        client_id: client.id
      }
      expect { post :create, params: { service_mapper: service_mapper_params } }.to change(ServiceMapper.all, :count).by(1)
    end

    it 'Does not create a service_mapper record if the the record is invalid' do
      service_mapper_params = {
        service_id: '',
        employee_id: employee.id,
        client_id: client.id
      }
      expect { post :create, params: { service_mapper: service_mapper_params } }.to change(ServiceMapper.all, :count).by(0)]
      # rubocop:enable Layout/LineLength
    end
  end

  describe 'Destroy' do
    it 'Reduces the number of created ServiceMappers by one' do
      service_mapper_params = {
        service_id: service.id,
        employee_id: employee.id,
        client_id: client.id
      }
      post :create, params: { service_mapper: service_mapper_params }
      expect { delete :destroy, params: { id: ServiceMapper.last.id } }.to change(ServiceMapper.all, :count).by(-1)
    end
    it 'Does not delete a record if it does not exist' do
      expect { delete :destroy, params: { id: mapper.id } }.to change(ServiceMapper.all, :count).by(0)
    end
  end
end
