class StopsController < ApplicationController
  def index
    #@stops = Stop.all(:limit=>30)
    @stops = Stop.geo_scope(:origin =>[47.7193756, -122.3004], :within=>20).offset(10).limit(10);    
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
    # @routes = [];
    #    @stops = Stop.find(:all, :limit=>3);
    #    @stops.each {|s|
    #      schedules = Schedule.find_all_by_stop_id([5420, 17650, 37060, 41450]);
    #      schedules.each do |schedule|
    #        if !schedule.nil? && !schedule.arrival_time.nil?
    #          arrival_time = Time.local(Time.now.year, Time.now.month, Time.now.day, schedule.arrival_time.hour, schedule.arrival_time.min );
    #          if  arrival_time - 60 < Time.now && arrival_time + 600 > Time.now
    #            route = Route.find_all_by_trip_id(schedule.trip_id, :limit=>1)[0];
    #            @routes << route;
    #          end
    #        end
    # 
    #      end
    # 
    #    }
    # 
    #    @routes;
    @stops = Stop.geo_scope(:origin =>[47.7193756, -122.3004], :within=>radius).offset(offset).limit(limit);
    render :index;
  end
end
