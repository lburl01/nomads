require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'when given an invalid input' do
    it 'will not save' do
      location = Location.new(name: 1234, region: false, city: false)

      expect(location).to be_invalid
    end
  end

  describe 'when given a valid input' do
    it 'will save the input' do
      location = Location.new(name: 'Oceania', region: true, city: false)

      expect(location.save!).to eq true
    end
  end

  describe 'when given valid a region name' do
    it 'will check for a cache file' do
      expect(File.exists?("cache/region_cache.json")).to eq true
    end

    context 'if cache file exists' do
      context 'and current url exists as a key' do
        it 'returns the json object value' do
        end
      end

      context 'and current url does not exist in the file' do
        it 'appends the file with new url key and json object value' do
        end
      end
    end

    context 'and .get_json is called on' do
      it 'returns a list of location data on that region' do

        location = Location.create(name: 'Oceania', region: true, city: false)

        allow(location).to receive(:get_json).and_return(JSON.parse(File.read("cache/oceania_region_cache.json")))

        response = location.get_json

        url = "https://nomadlist.com/api/v2/list/regions/#{location.name.downcase}"

        region_name = response[url]['result'][0]['info']['region']['name']

        expect(region_name).to eq("Oceania")
      end

    end
  end

end
