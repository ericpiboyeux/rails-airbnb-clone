class OrdersController < ApplicationController

before_action :find_order, only: [:show, :update, :destroy]

def index
  @orders = Order.joins(:user)
                 .where("user_id = ?", current_user.id)
end

def create
  @order = Order.new(order_params)
  @dish = @order.availability.dish
    if @order.save
      redirect_to orders_path
      # verifier la route exacte pour la redirection apres save order
    else
      render 'dishes/show'
    end

end


private

  def find_orders
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:portions, :review_description, :review_rating, :availability_id)
  end

end
