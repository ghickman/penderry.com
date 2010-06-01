require 'rubygems'
require 'sinatra'
require 'pony'
require 'haml'
require 'ostruct'

set :public, File.dirname(__FILE__)
set :views, File.dirname(__FILE__) + '/_includes'

helpers do
  def partial(page, options={})
    haml page, options.merge!(:layout => false)
  end
end

get '/contact' do
  @errors={}
  haml :contact
end

post '/contact' do
  @errors={}
  @errors[:name] = 'Please type your name' if params[:name].nil? || params[:name].empty?
  @errors[:mail] = 'Please leave your email so we can reply to you' if params[:mail].nil? || params[:mail].empty?
  @errors[:message] = 'Please type your message' if params[:message].nil? || params[:message].empty?
  
  if @errors.empty?
    Pony.mail(:to=>'cottages@penderry.com', :from=>"#{params[:mail]}", :subject=>"#{params[:subject]}", :body=>"#{params[:message]}")
    redirect 'http://localhost:4001/index.html'
  else
    haml :contact, :locals => {:page => @page}
  end
end