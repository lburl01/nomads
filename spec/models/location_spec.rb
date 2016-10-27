require 'rails_helper'

RSpec.describe Location, type: :model do
  context 'when given input' do
    context 'that is invalid' do
      it 'will not save' do
        location = Location.new(name: 1234, region: false, city: false)

        expect(location).to be_invalid
      end
    end
    context 'that is valid' do
      it 'will save the input' do
        location = Location.new(name: 'Oceania', region: true, city: false)

        expect(location.save!).to eq true
      end
    end
  end

  context 'when given a valid region name' do
    context 'and .get_json is called' do
      context 'check for existing region cache file' do
        context 'if file exists' do
          it 'return true' do
            location = Location.new(name: 'Oceania', region: true, city: false)
            response = location.get_json
            url = "https://nomadlist.com/api/v2/list/regions"

            expect(response).to eq true
          end
        end
        # context 'if file does not exist' do
        #   it 'creates a new file' do
        #   end
        # end
      end
    end
  end
end










  # describe 'when given valid a region name' do
  #   before(:each) do
  #     location = Location.create(name: 'Oceania', region: true, city: false)
  #   end
  #
  #   scenario 'and .get_json is called' do
  #     context 'it will look for a cache file' do
  #       it 'returns true if found' do
  #         expect(File.exists?("cache/region_cache.json")).to eq true
  #       end
  #
  #     context 'if cache file exists' do
  #       context 'and current url exists as a key' do
  #         it 'returns the json object value' do
  #           parsed_file = JSON.parse(File.read("cache/region_cache.json"))
  #           url = "https://nomadlist.com/api/v2/list/regions"
  #
  #           expect(parsed_file[url]).to include("ok" => true)
  #         end
  #       end
  #
  #     context 'and current url does not exist in the file' do
  #       it 'appends the file with new url key and json object value' do
  #         data = {}
  #         testIO = StringIO.new
  #
  #         data["test key"] = testIO
  #         file = File.write('cache/region_cache.json', data)
  #
  #         testIO.string.should == "Hello, world!"
  #       end
  #     end
  #
  #     context 'it will reference the cache or API response'
  #       it 'returns a list of location data on that region' do
  #         location = Location.create(name: 'Oceania', region: true, city: false)
  #
  #         allow(location).to receive(:get_json).and_return(JSON.parse(File.read("cache/region_cache.json")))
  #
  #         response = location.get_json
  #         url = "https://nomadlist.com/api/v2/list/regions"
  #
  #         region_name = response[url]['result'][0]['info']['region']['name']
  #
  #         expect(region_name).to eq("Oceania")
  #       end
  #
  #     end
  #   end
  # end
