class CheckinsController < ApplicationController
  def index
    @checkins = Checkins.all
  end

  def show
    @checkins = Checkins.find(params[:id])
  end

  def new
    @checkins = Checkins.new
  end

  def create
    @checkins = Checkins.new(params[:checkins])
    if @checkins.save
      flash[:notice] = "Successfully created checkins."
      redirect_to @checkins
    else
      render :action => 'new'
    end
  end

  def edit
    @checkins = Checkins.find(params[:id])
  end

  def update
    @checkins = Checkins.find(params[:id])
    if @checkins.update_attributes(params[:checkins])
      flash[:notice] = "Successfully updated checkins."
      redirect_to checkins_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @checkins = Checkins.find(params[:id])
    @checkins.destroy
    flash[:notice] = "Successfully destroyed checkins."
    redirect_to checkins_url
  end
end
