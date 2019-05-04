class CustomersController < ApplicationController
  include ActionView::Helpers::NumberHelper

  swagger_controller :customer, "Customer Management"

  swagger_api :index do
    summary "Fetches all Customers"
    notes "This lists all the Customers"
  end

  swagger_api :show do
    summary "Shows one Customer"
    param :path, :id, :integer, :required, "Customer ID"
    notes "This lists details of one customer"
    response :not_found
  end

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  def index
    @customers = Customer.all
  
    render json: @customers
  end

  def show
    render json: @customers
  end

  # def new
  #   @customer = Customer.new
  # end

  # def edit
  #   # reformat phone w/ dashes when displayed for editing (preference; not required)
  #   @customer.phone = number_to_phone(@customer.phone)
  # end

  # def create
  #   @customer = Customer.new(customer_params)
  #   if @customer.save
  #     redirect_to @customer, notice: "#{@customer.proper_name} was added to the system."
  #   else
  #     render action: 'new'
  #   end
  # end

  # def update
  #   if @customer.update(customer_params)
  #     redirect_to @customer, notice: "#{@customer.proper_name} was revised in the system."
  #   else
  #     render action: 'edit'
  #   end
  # end


  private
  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone, :active)
  end

end