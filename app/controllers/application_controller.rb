class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/customer/:id" do
    customer = Customer.all.find(params[:id])
    customer.to_json
  end

  get "/order" do
    Order.all.to_json
  end


end
