class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :index, :show]

  def index
    zone = DateTime.now.zone
    if params[:search][:slot] == 'Midi'
      @datetime = DateTime.parse(params[:search][:date] +  " 12:00")
    else
      @datetime = DateTime.new(params[:search]["date(1i)"].to_i,params[:search]["date(2i)"].to_i,params[:search]["date(3i)"].to_i, 20,0,0, zone)
    end

    @dishes = Dish.joins(:availabilities, :user).where("availabilities.availability_datetime = #{@datetime} and users.address LIKE '%#{params[:search][:address]}%'")
     byebug
    puts @dishes_results
    redirect_to root_path
  end
  def show
  end
end

#



