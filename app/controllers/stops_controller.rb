class StopsController < ApplicationController
  def index
    @stops = Stop.all;
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stops}
    end
    #@stops = Stop.geo_scope(:origin =>[47.7193756, -122.3004], :within=>20).offset(10).limit(10);    
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
    long = params[:long];
    lat = params[:lat];
    offset = params[:offset];
    limit=params[:limit];
    radius = params[:radius];
    
    @stops = Stop.geo_scope(:origin =>[long, lat], :within=>radius).offset(offset).limit(limit);
    @routes = [];
    respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @stops}
     end
    
  end
end
