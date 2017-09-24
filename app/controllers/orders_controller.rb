class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.prepare(params[:product_id], current_user.id)
    if @order.save
      redirect_to user_orders_path(current_user)
    else
      flash[:error] = "#{@order.errors.full_messages.join('\n')}"
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  private
    def order_params
      params.require(:order).permit(:quantity)
    end
end
