class RoutesController < ApplicationController
  def index
    @routes = Route.all(:limit=>10)
     respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @routes}
    end
  end

  def show
    @route = Route.find(params[:id])
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(params[:route])
    if @route.save
      flash[:notice] = "Successfully created route."
      redirect_to @route
    else
      render :action => 'new'
    end
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    if @route.update_attributes(params[:route])
      flash[:notice] = "Successfully updated route."
      redirect_to route_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @route = Route.find(params[:id])
    @route.destroy
    flash[:notice] = "Successfully destroyed route."
    redirect_to routes_url
  end
  
  def get_routes_by_stop_id
    bus_stop_id=params[:bus_stop_id]
    # @routes = Route.find_by_sql("select distinct routes.id, routes.bus_route_id, route_name, route_direction, routes.created_at, routes.updated_at
    #     from schedules, trips, routes where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and schedules.stop_id=#{bus_stop_id}");
    #     @routes.each{ |r|
    #       r["arrival_time"] = "15:06";
    #     }
    
     # @routes = Route.find_by_sql("select distinct routes.id, routes.bus_route_id, schedules.arrival_time, route_name, trips.trip_headsign 
      #                 from schedules, trips, routes 
      #                 where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and 
      #                 schedules.stop_id=#{bus_stop_id} AND trip_headsign <>'' and arrival_time >= (now()::time - interval '8 hours')  and arrival_time <= (now()::time + interval '7 hours 30 minutes')
      #                 order by route_name, arrival_time");

       # @routes = Route.find_by_sql("select distinct routes.id, routes.bus_route_id, schedules.arrival_time, route_name, trips.trip_headsign 
       #      from schedules, trips, routes 
       #      where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and 
       #      schedules.stop_id=#{bus_stop_id} AND trip_headsign <>''
       #      order by route_name, arrival_time");
    
    #adjusted for UTC :-( - xenia
    @routes = Route.find_by_sql("select distinct route_name, routes.id, routes.bus_route_id, schedules.arrival_time, route_name, trips.trip_headsign 
          from schedules, trips, routes 
          where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and 
          schedules.stop_id=#{bus_stop_id} AND trip_headsign <>'' and arrival_time >= (now()::time - interval '12 hours')  and arrival_time <= (now()::time - interval '11 hours 30 minutes')
          order by route_name, arrival_time");
    #comment below out for live ...
    # @routes = Route.find_by_sql("select distinct routes.id, routes.bus_route_id, schedules.arrival_time, route_name, trips.trip_headsign 
    #                                        from schedules, trips, routes 
    #                                        where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and 
    #                                        schedules.stop_id=#{bus_stop_id} AND trip_headsign <>''
    #                                        order by route_name, arrival_time");
    #      
    respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @routes}
    end
    
  end
  
  
  def get_bus_route_by_id_at_stop_id
    bus_stop_id=params[:bus_stop_id]
    bus_route_id=params[:bus_route_id]
    
    @routes = Route.find_by_sql("select distinct route_name, routes.id, routes.bus_route_id, schedules.arrival_time, route_name, trips.trip_headsign
    from schedules, trips, routes 
    where trips.route_id=routes.route_id and routes.bus_route_id=#{bus_route_id} and schedules.trip_id=trips.trip_id and 
    schedules.stop_id=#{bus_stop_id} AND trip_headsign <>'' and arrival_time >= (now()::time - interval '12 hours')  and arrival_time <= (now()::time - interval '11 hours 30 minutes')
    order by route_name, arrival_time");
    
    respond_to do |format|
       format.html { render 'get_routes_by_stop_id.html.erb'}
       format.xml  { render :xml => @routes}
    end
    
  end
  
  def get_routes_by_stop_id_no_constraint
      bus_stop_id=params[:bus_stop_id]
      
      @routes = Route.find_by_sql("select distinct routes.id, routes.bus_route_id, route_name, trips.trip_headsign
      from schedules, trips, routes 
      where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id 
      and schedules.stop_id=#{bus_stop_id} AND trip_headsign <>''");

      respond_to do |format|
         format.html # index.html.erb
         format.xml  { render :xml => @routes}
      end    
  end
  
  def insert_routes_at_stop
    @stops = Stop.all(:limit => 10);
    @stops.each do |s|
      @routes = Route.find_by_sql("select distinct route_name, trips.trip_headsign 
      from schedules, trips, routes 
      where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and 
      schedules.stop_id=#{s.bus_stop_id} AND trip_headsign <>''  
      order by route_name");
      
      routes_at_stop = @routes.join[','];
      puts "Hoho: #{routes_at_stop}";
      s.stop_routes =  routes_at_stop; 
      s.update_attribute(:stop_routes, routes_at_stop);     
    end
    
  end
      
end
