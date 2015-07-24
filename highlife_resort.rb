require 'sinatra'
require 'mandrill'

get '/' do
  erb :home
end


get '/home' do
	@title = "Home"
    @stylesheet = "Highlife.css"
    erb :home
end

get '/about' do
	@title = "About"
    @stylesheet = "Highlife.css"
    erb :about
end

get '/gallery' do
  @title = "Gallery"
    @stylesheet = "Highlife.css"
    erb :gallery
end

get '/contact' do
	@title = "Contact"
    @stylesheet = "Highlife.css"
	erb :contact
end


post '/contact' do
  name = params[:name]
  comments= params[:comments]
  email= params[:email]
  
  mandrill = Mandrill::API.new ENV['MANDRILL_APIKEY']
  
  message_to_mandrill = {
    :subject=> "Query about Highlife Resorts",
    :from_name=> name,
    :text=> comments,
    :to=> [{
      :email=> "vinson.lee.ny@gmail.com",
      :name=> "Vinson Lee"
    }],
    :html=> "<html>test html string</html>",
    :from_email=> "test@gmail.com"
  }
  sending = mandrill.messages.send message_to_mandrill
  puts sending

  erb :home
end
