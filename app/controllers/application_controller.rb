class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/customer/:id" do
    customer = Customer.find(params[:id])
    customer.include_total_spent_dishes_stats_favorite_dish.to_json
  end

  get "/order" do
    Order.all.each{ |o| o.include_customer_dishes_total_price}.to_json
  end

  get "/order/:id" do
    # is there a better way to call #totalPrice?
    # is there a better way to add a k|v pair to the json? 
    
    order = Order.find(params[:id])
    order.include_customer_dishes_total_price.to_json
  end

end
