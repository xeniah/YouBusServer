class StopsController < ApplicationController
  def index
    @stops = Stop.all
  end

  def show
    @stop = Stop.find(params[:id])
  end

  def new
    @stop = Stop.new
  end

  def create
    @stop = Stop.new(params[:stop])
    if @stop.save
      flash[:notice] = "Successfully created stop."
      redirect_to @stop
    else
      render :action => 'new'
    end
  end

  def edit
    @stop = Stop.find(params[:id])
  end

  def update
    @stop = Stop.find(params[:id])
    if @stop.update_attributes(params[:stop])
      flash[:notice] = "Successfully updated stop."
      redirect_to stop_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    flash[:notice] = "Successfully destroyed stop."
    redirect_to stops_url
  end
  
  def get_nearest
    @long = params[:long];
    @lat = params[:lat];
    
  end
end
