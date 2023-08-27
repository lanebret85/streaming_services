class StreamingServiceShowsController < ApplicationController
  def index
    @streaming_service = StreamingService.find(params[:id])
    @shows = @streaming_service.shows
  end

  def new
    @streaming_service = StreamingService.find(params[:id])
  end

  def create
    streaming_service = StreamingService.find(params[:id])
    great_british_baking_show = streaming_service.shows.create!(streaming_service_show_params)
    redirect_to "/streaming_services/#{streaming_service.id}/shows"
  end

private
  def streaming_service_show_params
    params.permit(:name, :genre, :released, :seasons, :episodes, :episode_runtime)
  end
end