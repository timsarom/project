class AdminController < ApplicationController
  def index
  	@orders = Order.all
  	@total_orders = Order.where(:ship_date => nil).count
  end
end
