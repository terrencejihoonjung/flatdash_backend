class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/customer/:id" do
    customer = Customer.find(params[:id])
    customer.include_total_spent_dishes_stats_favorite_dish.to_json
  end

  get "/orders" do
    Order.all.map{ |o| o.include_customer_dishes_total_price}.to_json
  end

  get "/order/:id" do
    # is there a better way to call #totalPrice?
    # is there a better way to add a k|v pair to the json? 
    
    order = Order.find(params[:id])
    order.include_customer_dishes_total_price.to_json
  end

  delete '/order/:id' do
    order = Order.find(params[:id])
    order.destroy
    order.to_json
  end

  get "/customer_lookup/:email" do
    Customer.find_by(email_address: params[:email]).id.to_json
  end

end
