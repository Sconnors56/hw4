class EntriesController < ApplicationController
  before_action :require_login
  before_action :set_place             

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new
    @entry["title"]       = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry.place_id       = @place.id   
    @entry.user_id        = @current_user.id

    if params[:image].present?
      @entry.image.attach(params[:image])
    end
    
    if @entry.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  private

  def set_place
    @place = Place.find(params[:place_id])  
  end
end

