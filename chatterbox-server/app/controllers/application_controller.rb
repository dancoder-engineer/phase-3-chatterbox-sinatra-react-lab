class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    mes = Message.all
    mes.to_json
  end

  post '/messages' do
    mes = Message.create(
      body: params[:body],
      username: params[:username]
    )
    mes.to_json
  end

  patch '/messages/:id' do
    mes = Message.find(params[:id])
    mes.update(
      body: params[:body]
    )
    mes.to_json
  end

  delete '/messages/:id' do
    mes = Message.find(params[:id])
    mes.destroy
    mes.to_json
  end

end
