class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/customer/:id" do
    Customer.all.find(params[:id])
  end

end
