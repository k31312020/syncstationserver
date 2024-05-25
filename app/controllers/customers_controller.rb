require 'pry'

class CustomersController < ApplicationController
  include RenderErrorsHandler

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  before_action :set_customer, only: [:show, :update, :destroy]
  
  def show
    render json: @customer
  end

  def create
    customer = Customer.create!(customer_params)
    render json: customer, status: :created
  end

  def update
    @customer.update!(customer_params)
    render json: @customer
  end

  def destroy
    @customer.destroy
    head :no_content
  end

  def search
    customers = Customer.where("firstname LIKE ?", params[:q])
    render json: customers
  end

  private 

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:firstname, :middlename, :lastname, :email, :phone, :state, :zip, :city, :street)
    end

end
