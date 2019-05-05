class OrdersController < ApplicationController
  swagger_controller :orders, "Orders Management"

  before_action :set_order, only: [:show]

  swagger_api :index do
    summary "Fetches all orders"
    notes "This lists all the orders"
  end

  swagger_api :show do
    summary "Shows one Order"
    param :path, :id, :integer, :required, "Order ID"
    notes "This lists details of one order"
    response :not_found
  end

  def index
    @all_orders = Order.all
    render json: @all_orders, each_serializer: OrderSerializer
  end

  def show
    render json: @order, serializer: OrderShowSerializer
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:address_id, :customer_id, :grand_total)
  end
end
