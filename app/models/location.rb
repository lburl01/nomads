require 'json'

class Location < ApplicationRecord

  validates_presence_of :name
  validates_format_of :name, with: /[a-zA-Z]/

  # attr_accessor :name
  #
  # def initialize(options = {})
  #   @name = options[:name]
  # end

  def check_existence(file)
    File.exists?(file)
  end

  def write_file_if_none(file)
    if check_existence(file) == false
      f = File.new("cache/region_cache2.json")
    end
  end

  def get_json
    # parsed_file = {}
    #
    # if File.exists?("memory.json")
    #   parsed_file = JSON.parse(File.read("memory.json"))
    #   if parsed_file.key?(url)
    #     file_data = parsed_file[url]
    #     puts "found file"
    #     return file_data
    #   end
    # end
    # puts "out of if"
    # data = HTTParty.get(url).parsed_response
    #
    # parsed_file[url] = data
    # File.write('memory.json', JSON.dump(parsed_file))
    #
    # return data
  end
end
