class ServiceMappersController < ApplicationController
    def new
        @service_mapper = ServiceMapper.new(service_mapper_params)
      end
    
      def create
        @service_mapper = ServiceMapper.new(service_mapper_params)
        if @service_mapper.save
          redirect_back(fallback_location: root_path)
        else
          flash[:alert] = "Ooops, something went wrong"
        end
      end
    
      def index
        @service_mappers = ServiceMapper.all
      end
    
      def destroy
        @service_mapper = ServiceMapper.find_by_id(params[:id])
        if @service_mapper
          redirect_back(fallback_location: root_path) if @service_mapper.destroy
        else
          flash[:alert] = 'Ooops, Record was not found'
        end
      end
    
      def show
        @service_mapper = ServiceMapper.find_by_id(params[:id])
      end
    
      private
    
      def service_mapper_params
        params.require(:service_mapper).permit(:service_id, :client_id, :employee_id)
      end
end
