class CustomersController < ApplicationController
  include ActionView::Helpers::NumberHelper

  swagger_controller :customers, "Customers Management"

  before_action :set_customer, only: [:show]

  swagger_api :index do
    summary "Fetches all customers"
    notes "This lists all the customers"
  end

  swagger_api :show do
    summary "Shows one Customer"
    param :path, :id, :integer, :required, "Customer ID"
    notes "This lists details of one customer"
    response :not_found
  end

  def index
    # @customers = Customer.all
    @customers = Customer.alphabetical.all
    render json: @customers
  end

  def show
    # @previous_orders = @customer.orders.chronological
    render json: @customer
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone, :active)
  end
end
