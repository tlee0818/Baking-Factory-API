class OrdersController < ApplicationController

  swagger_controller :customer, "Order Management"

  swagger_api :index do
    summary "Fetches all Orders"
    notes "This lists all the Orders"
  end

  swagger_api :show do
    summary "Shows one Order"
    param :path, :id, :integer, :required, "Order ID"
    notes "This lists details of one order"
    response :not_found
  end

  before_action :set_order, only: [:show, :destroy]
  
  def index
    @orders = Order.all
  
    render json: @orders
  end

  def show
    render json: @orders
  end

  # def new
  #   @order = Order.new
  # end

  # def create
  #   @order = Order.new(order_params)
  #   @order.date = Date.current
  #   if @order.save
  #     @order.pay
  #     redirect_to @order, notice: "Thank you for ordering from the Baking Factory."
  #   else
  #     render action: 'new'
  #   end
  # end
  

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:address_id, :customer_id, :grand_total)
  end

end