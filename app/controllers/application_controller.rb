class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/customers" do
    Customer.all.to_json
  end

  get "/customers/:id" do
    customer = Customer.find(params[:id])
    customer.include_total_spent_dishes_stats_favorite_dish.to_json
  end

  get "/orders" do
    Order.all.map{ |o| o.include_customer_dishes_total_price}.to_json
  end

  get "/orders/:id" do
    # is there a better way to call #totalPrice?
    # is there a better way to add a k|v pair to the json? 
    
    order = Order.find(params[:id])
    order.include_customer_dishes_total_price.to_json
  end

  get "/menu_items" do 
    MenuItem.all.to_json
  end

  get "/menu_items/:id" do 
    MenuItem.find(params[:id]).to_json
  end

  delete '/orders/:id' do
    order = Order.find(params[:id])
    order.destroy
    order.to_json
  end

  get "/customer_lookup/:email" do
    Customer.find_by(email_address: params[:email]).id.to_json
  end

  patch '/orders/:id' do
    order = Order.find(params[:id])    
    order.update(
      status: params[:status]
    )
    order.include_customer_dishes_total_price.to_json
  end

  post '/order' do
    search = Customer.find_by(email_address: params[:email])
    if !search
      new_customer = Customer.create(name: params[:name], 
        email_address: params[:email], 
        phone_number: params[:phone])
    else
      new_customer = search
    end

    new_order = Order.create(status: "Queued", 
      delivery: params[:delivery], 
      customer_id: new_customer.id)
      
    params[:dishesToAdd].each do |dish|
      Dish.create(
        quantity: params[:quantity][dish[:id].to_s],
        menu_item_id: dish[:id],
        order_id: new_order.id)
    end
    #Then create new dishes after that
  end

  get "/dishes" do 
    Dish.all.to_json
  end

end
