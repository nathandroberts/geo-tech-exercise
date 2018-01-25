require 'spec_helper'
describe DevicesController do

  include Rack::Test::Methods

  def app
    DevicesController.new
  end

  context 'App'do

    it "should have a functional homepage route" do
      get '/'
      expect(last_response).to be_ok
      # will fail if there is an error preventing the page from loading or the route does not exist
      expect(last_response.body).to include("Home Page")

    end

    it "should display the homepage title" do
      get '/'
      expect(last_response.body).to include("Home Page")
      #searches html for matching text
    end


    it "should display a device name on home page" do
      get '/'
      expect(last_response.body).to include("hub_ethernet_cosy")
    end

    it "should display notes for a device on the home page" do
      get '/'
      expect(last_response.body).to include("Cosy hub, Ethernet microcontroller")
    end

    it "should display a search page" do
      get '/search'
      expect(last_response).to be_ok
      expect(last_response.body).to include("Search Results")
    end

    it "should display the search page title" do
      get '/search'
      expect(last_response.body).to include("Search Results")
    end

    it "should display the correct search results" do
      # url generated after a search for ct is submitted
      get '/search?device_search=ct'
      # correct ct notes
      expect(last_response.body).to include("Legacy Legato CT transmitter")
      get '/search?device_search=hub_ethernet_cosy'
      expect(last_response.body).to include("Cosy hub, Ethernet microcontroller")
    end

    it "should display correct device notes if the route is correct" do
      # url generated after a search for ct is submitted
      get '/devices/smartplug'
      # correct ct notes
      expect(last_response.body).to include("Legacy Legato smartplug")
    end

  end
end
