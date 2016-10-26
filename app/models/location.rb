require 'json'

class Location < ApplicationRecord

  validates_presence_of :name
  validates_format_of :name, with: /[a-zA-Z]/

  # attr_accessor :name
  #
  # def initialize(options = {})
  #   @name = options[:name]
  # end

  def get_json
  end
end
