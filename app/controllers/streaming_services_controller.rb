class StreamingServicesController < ApplicationController
  def index
    @streaming_services = StreamingService.all
  end

  def show
    @streaming_service = StreamingService.find(params[:id])
    if StreamingService.find(params[:id]).subscribed
      @subscribed_y_n = "Yes"
    else
      @subscribed_y_n = "No"
    end
    if StreamingService.find(params[:id]).logged_in
      @logged_in_y_n = "Yes"
    else
      @logged_in_y_n = "No"
    end
  end

  def new
  end

  def create
    apple_tv_plus = StreamingService.create!(streaming_service_params)
    redirect_to "/streaming_services"
  end

  def edit
    @streaming_service = StreamingService.find(params[:id])
  end

  def update
    streaming_service = StreamingService.find(params[:id])
    streaming_service.update(streaming_service_params)
    redirect_to "/streaming_services/#{streaming_service.id}"
  end

  def destroy
    streaming_service = StreamingService.find(params[:id])
    streaming_service.destroy

    redirect_to "/streaming_services"
  end

private
  def streaming_service_params
    params.permit(:name, :subscribed, :logged_in, :rating)
  end
end