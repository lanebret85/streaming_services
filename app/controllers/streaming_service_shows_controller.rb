class StreamingServiceShowsController < ApplicationController
  def index
    @streaming_service = StreamingService.find(params[:id])
    @shows = @streaming_service.shows
  end
end