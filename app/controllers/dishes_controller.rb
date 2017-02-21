class DishesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :index, :show]

  def index
    # byebug
    if params[:search][:slot] == 'Midi'
      @datetime = DateTime.new(params[:search]["date(1i)"].to_i,params[:search]["date(2i)"].to_i,params[:search]["date(3i)"].to_i, 12,0,0)
    else
      @datetime = DateTime.new(params[:search]["date(1i)"].to_i,params[:search]["date(2i)"].to_i,params[:search]["date(3i)"].to_i, 20,0,0)
    end

    @dishes = Dish.joins(:availabilities,:users).where("availabilities.availability_datetime = #{@datetime}", "users.address=#{params[:search][:address]}")
    puts @dishes_results
    redirect_to root_path
  end
  def show
  end
end



