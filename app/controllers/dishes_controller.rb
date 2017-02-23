class DishesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search, :index, :show, :create, :new]

  def index
    #zone = DateTime.now.zone
    if params[:search][:slot] == 'Midi'
      @datetime = DateTime.parse(params[:search][:date] +  " 12:00 UTC +00:00")
    else
      @datetime = DateTime.parse(params[:search][:date] +  " 20:00")
    end



    @dishes = Dish.joins(:availabilities, :user, :orders)
              .where("availabilities.available_datetime = ?  and users.address LIKE ? ", @datetime, "%#{params[:search][:address]}%")


    @users = []
    @dishes.each do |dish|
      @users <<  dish.user  if dish.user.latitude && dish.user.longitude
    end
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
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
