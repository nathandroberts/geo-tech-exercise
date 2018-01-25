require 'spec_helper'
describe Devices do

  context 'Model array containing name and notes data'do

  before(:all) do
    @array = Devices.new.zipped_array
  end

    it "should be an array" do
      expect(@array).to be_a(Array)
    end

    it "should have 2 items in each array input" do
      @array.each do |position|
        expect(position.length).to eq(2)
      end
    end

    it "should contain strings for every input" do
      @array.each do |item|
        expect(item[0] && item[1]).to be_a(String)
      end
    end

  end
end
