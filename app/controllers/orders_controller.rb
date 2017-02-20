class OrdersController < ApplicationController

before_action :find_order, only: [:show, :update, :destroy]

def index
  @orders = Order.all
end

def create
  @order = Order.new(order_params)
    if @order.save
      redirect_to orders_path(@order)
      # verifier la route exacte pour la redirection apres save order
    else
      render :new
    end

end


private

  def find_orders
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:portions)
  end

end
