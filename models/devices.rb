require 'nokogiri'
class Devices

  # Creates instance variables and also makes them visible and editable outside the object.
  attr_accessor :xml, :name_array, :value_array, :notes_array, :zipped_array

  def initialize
    @xml = Nokogiri::XML(File.open('./mini-schema.xml'))
    @name_array = []
    @value_array = []
    @notes_array = []
    name_array_maker
    value_array_maker
    notes_array_maker
    @zipped_array = name_notes_zip
  end

  def name_array_maker
    @xml.xpath('//name').each do |name|
      @name_array << name.text
    end
    @name_array
  end

  def value_array_maker
    @xml.xpath('//value').each do |value|
      @value_array << value.text
    end
    @value_array
  end

  def notes_array_maker
    @xml.xpath('//notes').each do |notes|
      @notes_array << notes.text
    end
    @notes_array
  end

  def search
    @xml.search('device')
  end

  def name_notes_zip
    @name_array.zip(@notes_array)
  end
end
