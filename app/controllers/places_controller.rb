class PlacesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @places = Place.all.order(:name)
  end

  def show
    @place = Place.find(params[:id])
    @entries = Entry.where(
      place_id: @place.id,
      user_id:   session[:user_id]    
    ).order(occurred_on: :desc)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(name: params[:name])
    if @place.save
      redirect_to places_path
    else
      render :new
    end
  end
end

