require 'sinatra/base'
require 'sinatra/reloader'
require_relative '../models/devices.rb'
class DevicesController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), '..')

  set :views, Proc.new { File.join(root, 'views')}

  get '/' do
    @title = 'All devices and notes'
    device = Devices.new
    # @device_data = [1,2,3]
    @name_data = device.name_array
    # @value_data = note.value_array_maker
    @notes_data = device.notes_array_maker
    erb :'devices/index'
  end

  get '/search' do
    device = Devices.new
    @name_data = device.zipped_array
    @name_input = params[:device_search]
    erb :'devices/search'
  end


  get '/devices/:device' do
    device = Devices.new
    @name_data = device.zipped_array
    @name_input = params[:device]
    erb :'devices/show'
  end

end
