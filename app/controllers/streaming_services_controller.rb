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
end