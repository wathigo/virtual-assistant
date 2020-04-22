class ServicesController < ApplicationController
  def new
    @service = Service.new(service_params)
  end

  def create
    @service = Service.new(service_params)
    if @service.save
      redirect_back(fallback_location: root_path)
    else
      render :new
    end
  end

  def index
    @services = Service.all
  end

  def destroy
    @service = Service.find_by_id(params[:id])
    redirect_back(fallback_location: root_path) if @service.delete
  end

  def destroy
    @service = Service.find_by_id(params[:id])
    if @service
      redirect_back(fallback_location: root_path) if @service.destroy
    else
      flash[:alert] = "Ooops, Record was not found"
    end
  end

  def show
    @service = @service = Service.find_by_id(params[:format])
  end

  private

  def service_params
    params.require(:service).permit(:name, :category_id)
  end
end
