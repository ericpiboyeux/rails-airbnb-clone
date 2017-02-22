class DishesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search, :index, :show, :create, :new]

  def index
    #zone = DateTime.now.zone
    if params[:search][:slot] == 'Midi'
      @datetime = DateTime.parse(params[:search][:date] +  " 12:00 UTC +00:00")
    else
      @datetime = DateTime.parse(params[:search][:date] +  " 20:00")
    end

    @dishes = Dish.joins(:availabilities, :user).where("availabilities.available_datetime = ?  and users.address LIKE ? ", @datetime, "%#{params[:search][:address]}%")
  end

  def show

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

end
