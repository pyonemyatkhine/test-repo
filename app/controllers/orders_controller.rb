class OrdersController < ApplicationController
  def index
	@orders=Order.all
  end

  def show
    @detail=Order.find(params[:id])
  end

  def new
    @order=Order.new
    3.times {@order.order_details.build}#It will be able to select three products
    @products=Product.all
  end

  def create
    @order=Order.new(order_params)
    @products=Product.all

    if @order.save
      redirect_to @order
    else
      render action:'new'
    end
  end

  private
  def order_params
    params.require(:order).permit(order_details_attributes:[:product_id,:count])
  end
end
