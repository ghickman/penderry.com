require 'rubygems'
require 'sinatra'
require 'pony'
require 'haml'

set :haml, {:format => :html5}
set :public, File.dirname(__FILE__)
set :views, File.dirname(__FILE__)

# Create the page class and give it a title of Contact for the layout
class Page
  def body
    'contact'
  end
end

def contact
  # create the variables that the layout will expect
  page = Page.new
  content = haml :contact

  # render the contact page using jekyll's layout and with our mock jekyll vars
  haml :contact, :layout=>:'_layouts/default', :locals=>{:page=>page, :content=>content}
end

get '/contact' do
  @errors={}
  contact
end

post '/contact' do
  @errors={}
  @errors[:name] = 'Please enter your name' if params[:name].nil? || params[:name].empty?
  @errors[:mail] = 'Please leave your email so we can reply to you' if params[:mail].nil? || params[:mail].empty?
  @errors[:message] = 'Please enter your message' if params[:message].nil? || params[:message].empty?

  if @errors.empty?
    Pony.mail(:to=>'contact@penderry.com', :from=>"#{params[:mail]}", :subject=>"Penderry.com Message from: #{params[:name]}", :body=>"#{params[:message]}")
    redirect '/index.html'
  else
    contact
  end
end
