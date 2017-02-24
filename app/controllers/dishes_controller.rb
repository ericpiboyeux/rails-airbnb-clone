class DishesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search, :index, :show, :create, :new]

  def index

    @searched_date = params[:search][:date]
    @searched_slot = params[:search][:slot]
    @searched_address = params[:search][:address]
    @searched_portions = params[:search][:portions].to_i
    @searched_types = params[:search][:types]

    if @searched_date.present?
      if @searched_slot == 'Midi'
        @datetime = DateTime.parse(@searched_date +  " 12:00 UTC +00:00")
      elsif @searched_slot == 'Soir'
        @datetime = DateTime.parse(@searched_date +  " 20:00 UTC +00:00")
      end
    end

    @dishes = Dish.joins(:availabilities)
    @dishes = @dishes.where("availabilities.available_datetime = ? ", @datetime) if @datetime
    @dishes = @dishes.where("availabilities.left_portions >= ? ", @searched_portions) if @searched_portions.present?
    @dishes = @dishes.where("dishes.bio = ? ", true) if @searched_types && @searched_types[0].present?
    @dishes = @dishes.where("dishes.gluten_free = ? ", true) if @searched_types && @searched_types[1].present?
    @dishes = @dishes.where("dishes.vegetarian = ? ", true) if @searched_types && @searched_types[2].present?

    @users = []
    portions_results = []
    @dishes.each do |dish|
      @users <<  dish.user  if dish.user.latitude && dish.user.longitude
      dish.availabilities.each do |availability|
        portions_results << availability.left_portions if availability.left_portions > 0
      end
    end
    (portions_results.count > 1) ? @max_results_portions = portions_results.max : @max_results_portions =1

    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
    # if @searched_address
    #   @searched_coordinates = Geocoder.search(@searched_address).first
    #   @searched_hash = Gmaps4rails.build_markers(@searched_coordinates) do |coord, marker|
    #     marker.lat coord[:lat]
    #     marker.lng coord[:lng]
    #   end
    # end
  end

  def show
    # @dish for TEST use only
    @dish = Dish.find(params[:id])
    @chosen = Dish.find(params[:id]).availabilities.first
    # replace it with => @dish = Dish.find(dish_params)
    @chosen_availability = format_datetime(@chosen.available_datetime)
    #@other = Dish.find(1).availabilities.to_a.delete(chosen)
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    if @dish.save
      redirect_to dishes_path
    else
      render :new
    end
  end

  private

  def dish_params
    params.require(:dish).permit(:name, :description, :gluten_free, :vegetarian, :bio, :photo)
  end

  def format_datetime(datetime)
    datetime.hour == 12 ? lunch = "Midi" : lunch = "Soir"
    return "#{datetime.day}/#{datetime.month}/#{datetime.year}, #{lunch}"
  end

end
