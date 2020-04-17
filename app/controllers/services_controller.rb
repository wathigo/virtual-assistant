class ServicesController < ApplicationController
  def new; end

  def create
    @service = service.new(service_params)
    if @service.save
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Somethig went wrong'
    end
  end

  def index
    @services = service.all
  end

  def destroy
    @service = service.find_by_id(params[:format])
    redirect_back(fallback_location: root_path) if @service.destroy
  end

  def show
    @service = @service = service.find_by_id(params[:format])
  end

  private

  def service_params
    params.require(:service).permit(:name, :category_id)
  end
end
