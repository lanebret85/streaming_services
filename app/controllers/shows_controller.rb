class ShowsController < ApplicationController
  def index
    @shows = Show.all

    # if Show.find(params[:id]).released
    #   @released_y_n = "Yes"
    # else
    #   @released_y_n = "No"
    # end
    # if Show.find(params[:id]).streaming_service_id == 1
    #   @streaming_service = "Netflix"
    # elsif Show.find(params[:id]).streaming_service_id == 2
    #   @streaming_service = "Hulu"
    # elsif Show.find(params[:id]).streaming_service_id == 3
    #   @streaming_service = "Disney Plus"
    # end
  end

  def show
    @show = Show.find(params[:id])
    if @show.released
      @released_y_n = "Yes"
    else
      @released_y_n = "No"
    end
    # binding.pry
    # if @show.streaming_service_id == 1
    #   @streaming_service = "Netflix"
    # elsif @show.streaming_service_id == 2
    #   @streaming_service = "Hulu"
    # elsif @show.streaming_service_id == 0
    #   @streaming_service = "Disney Plus"
    # end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    show = Show.find(params[:id])
    show.update(show_params)
    redirect_to "/shows/#{show.id}"
  end

private
  def show_params
    params.permit(:name, :genre, :released, :episodes, :seasons, :episode_runtime)
  end
end