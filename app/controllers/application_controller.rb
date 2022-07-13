class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/customer/:id" do
    customer = Customer.find(params[:id])
    customer.to_json(include: :orders)
  end

  # For each order we want to include the customer and menu items 
  get "/order" do
    Order.all.to_json(include: :customer)
  end

  get "/order_price/:id" do
    # is there a better way to call #totalPrice?
    # is there a better way to add a k|v pair to the json? 
    order = Order.find(params[:id])
    orderPrice = order.totalPrice
  
    order_json = order.to_json

    h = JSON.parse(order_json)
    h.store(:total, orderPrice)
    h.to_json
  end

end
