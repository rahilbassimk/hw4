class PlacesController < ApplicationController

  def index
    if @current_user
      @places = Place.where({"user_id" => @current_user["id"]})
          
    else
      #will need to login
    end
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    if @current_user
      @entries = Entry.where({ "place_id" => @place["id"],"user_id" => @current_user["id"] })
    else
     #show.HTML is providing the output if user is not logged in
    end 
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place["user_id"] = current_user["id"]
    @place.save
    redirect_to "/places"
  end

end
