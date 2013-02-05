require 'spec_helper'
require 'cartographie/map'

describe Cartographie::Map do

  subject { described_class.new }

  describe 'with options' do
    let(:options) do
      { width: 75, height: 75, zoom: 10, file_format: 'jpg', sensor: true, api_endpoint: 'endpoint' }
    end
    subject { described_class.new 'New York, NY', options }

    its(:location) { should eq('New York, NY') }
    its(:width) { should eq(75) }
    its(:height) { should eq(75) }
    its(:size) { should eq('75x75') }
    its(:zoom) { should eq(10) }
    its(:file_format) { should eq('jpg') }
    its(:sensor) { should be_true }
    its(:api_endpoint) { should eq('endpoint') }
  end

  describe '#uri' do
    let(:map) { described_class.new 'Tokyo' }

    subject { map.uri }

    it "should match the instance's string representation" do
      subject.should eq(map.to_s)
    end

    it 'returns a Google Static Maps URI' do
      subject.should include('http://maps.googleapis.com/maps/api/staticmap')
    end

    it 'contains the map location' do
      subject.should include(map.location)
    end

    it 'contains the map size, like 640x640' do
      subject.should include(map.size)
    end

    it 'contains the map zoom level' do
      subject.should include(map.zoom.to_s)
    end

    it 'contains the map file format' do
      subject.should include(map.file_format)
    end

    it 'contains the map sensor indication' do
      subject.should include(map.sensor.to_s)
    end
  end

end
