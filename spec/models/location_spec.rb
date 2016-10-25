require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'when given a region name' do
    context 'and .get_json is called on' do
      it 'returns a list of location data on that region' do

        location = Location.create(name: 'Oceania')

        allow(location).to receive(:get_json).and_return(JSON.parse(File.read("cache/oceania_region_cache.json")))

        response = location.get_json

        url = "https://nomadlist.com/api/v2/list/regions/#{location.name.downcase}"
        region_name = response[url]['result'][0]['info']['region']['name']

        expect(region_name).to eq("Oceania")

      end
    end
  end
end
