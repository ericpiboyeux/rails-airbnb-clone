class OrdersController < ApplicationController

before_action :find_order, only: [:show, :update, :destroy]

def index
  @orders = Order.all
end

def new
  @order = Order.new
end

def create
  @order = Order.new(order_params)
    if @order.save
      redirect_to order_index_path(@order)
      # verifier la route exacte pour la redirection apres save order
    else
      render :index
    end

end


private

  def find_orders
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:portions, :review_description, :review_rating, :user_id, :availability_id)
  end

end
