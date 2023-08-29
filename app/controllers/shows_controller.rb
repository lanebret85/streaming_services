class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def show
    @show = Show.find(params[:id])
    if @show.released
      @released_y_n = "Yes"
    else
      @released_y_n = "No"
    end
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    show = Show.find(params[:id])
    show.update(show_params)
    redirect_to "/shows/#{show.id}"
  end

  def destroy
    show = Show.find(params[:id])
    show.destroy

    redirect_to "/shows"
  end

private
  def show_params
    params.permit(:name, :genre, :released, :episodes, :seasons, :episode_runtime)
  end
end