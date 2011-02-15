class RoutesController < ApplicationController
  def index
    @routes = Route.all(:limit=>10)
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
    stop_id=params[:stop_id]
    @routes = Route.find_by_sql("select distinct routes.id, routes.route_id, route_name, route_direction, routes.created_at, routes.updated_at
    from schedules, trips, routes where trips.route_id=routes.route_id and schedules.trip_id=trips.trip_id and stop_id=#{stop_id}");
    
    
  end
  
end
