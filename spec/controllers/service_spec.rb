require 'rails_helper'

RSpec.describe ServicesController, type: :controller do
  let(:tech) { FactoryBot.create(:category) }
  let(:service) { FactoryBot.create(:service, category_id: tech.id) }
  describe '#create' do
    it 'Increases created Services by one if the record is valid' do
      service_params = FactoryBot.attributes_for(:service, category_id: tech.id)
      expect { post :create, params: { service: service_params } }.to change(Service.all, :count).by(1)
    end

    it 'Does not create a service record if the the record is invalid' do
      service_params = { name: '', category_id: tech.id}
      expect { post :create, params: { service: service_params } }.to change(Service.all, :count).by(0)
    end
  end

  describe 'Destroy' do
    it 'Reduces the number of created Services by one' do
      post :create, params: { service: { name: 'Secretarial', category_id: tech.id } }
      expect { delete :destroy, params: { id: Service.last.id } }.to change(Service.all, :count).by(-1)
    end
    it 'Does not delete a record if it does not exist' do
      expect { delete :destroy, params: { id: service.id } }.to change(Service.all, :count).by(0)
    end
  end
end
