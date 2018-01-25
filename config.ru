require "sinatra"
require 'sinatra/reloader' if development?
require 'pg'
require "httparty"
require "json"
require 'rubygems'
require_relative './models/devices.rb'
require_relative './controllers/devices_controller.rb'
require './controllers/devices_controller'
require './models/devices'

use Rack::MethodOverride

run DevicesController
