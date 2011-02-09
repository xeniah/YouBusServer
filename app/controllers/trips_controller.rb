class TripsController < ApplicationController
  def index
    @trips = Trips.all
  end

  def show
    @trips = Trips.find(params[:id])
  end

  def new
    @trips = Trips.new
  end

  def create
    @trips = Trips.new(params[:trips])
    if @trips.save
      flash[:notice] = "Successfully created trips."
      redirect_to @trips
    else
      render :action => 'new'
    end
  end

  def edit
    @trips = Trips.find(params[:id])
  end

  def update
    @trips = Trips.find(params[:id])
    if @trips.update_attributes(params[:trips])
      flash[:notice] = "Successfully updated trips."
      redirect_to trips_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @trips = Trips.find(params[:id])
    @trips.destroy
    flash[:notice] = "Successfully destroyed trips."
    redirect_to trips_url
  end
end
