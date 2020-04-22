class ServiceMapper < ApplicationRecord
    belongs_to :employee, class_name: 'User'
    belongs_to :client, class_name: 'User'
    belongs_to :service
    
    validates :employee, presence: true
    validates :client, presence: true
end
