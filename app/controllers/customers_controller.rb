class CustomersController < ApplicationController

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def search
  end

  private 

  def customer_params
    params.require(:customer).permit(Customer.attribuite_names)
  end

end
