require 'spec_helper'
require 'cartographie/map'
require 'uri'

describe Cartographie::Map do

  subject { described_class.new }

  let(:points) { ["Empire State Building", "40.704154,-73.99459", "Guggenheim Museum"] }

  describe 'initialize map' do

    context "valid options" do
      let(:options) { { center: 'New York, NY', width: 75, height: 75, zoom: 10, file_format: 'jpg', sensor: true, points: points } }

      subject { described_class.new options }

      its(:center) { should eq('New York, NY') }
      its(:width) { should eq(75) }
      its(:height) { should eq(75) }
      its(:size) { should eq('75x75') }
      its(:zoom) { should eq(10) }
      its(:file_format) { should eq('jpg') }
      its(:sensor) { should be_true }
      its(:points) { should =~ (points) }
    end
  end

  describe "#additional_markers" do

    context "no additional markers" do
      let(:map) { described_class.new() }

      subject { map.additional_markers }

      it 'returns an emtpy string' do
        subject.should be_empty
      end
    end

    context 'mixed array to string' do
      let(:options) { { points: points } }
      let(:map) { described_class.new(options) }

      subject { map.additional_markers }

      it 'returns a pipe seperated string' do
        subject.should eq("Empire+State+Building|40.704154,-73.99459|Guggenheim+Museum")
      end
    end
  end

  describe '#query_string' do

    context 'build query string from hash of params' do
      let(:options) { { center: 'Tokyo', width: 300, height: 300, zoom: 10, file_format: 'jpg', sensor: true } }
      let(:map) { described_class.new(options) }

      subject { map.query_string }

      it 'returns a formatted query string' do
        subject.should eq('center=Tokyo&size=300x300&zoom=10&format=jpg&sensor=true')
      end
    end

    context 'build query string from params hash with additional points' do
      let(:options) { { center: 'Paris, FR', width: 300, height: 300, zoom: 10, file_format: 'jpg', sensor: true, points: ['Eiffel Tower', 'Louvre'] } }
      let(:map) { described_class.new(options) }

      subject { map.query_string }

      it 'returns a formatted query string with additional markers' do
        subject.should eq('center=Paris,%20FR&size=300x300&zoom=10&format=jpg&sensor=true&markers=Eiffel+Tower%7CLouvre')
      end
    end
  end

  describe '#uri' do

    context 'single marker uri' do
      let(:map) { described_class.new center: 'Tokyo' }

      subject { map.uri }

      it "should match the instance's string representation" do
        subject.should eq(map.to_s)
      end

      it 'returns a Google Static Maps URI' do
        subject.should include('http://maps.googleapis.com/maps/api/staticmap')
      end

      it 'contains the map center' do
        subject.should include(map.center)
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

    context 'multiple markers' do
      let(:options) { { center: 'New York, NY', points: points } }
      let(:map) { described_class.new(options) }

      subject { map.uri }

      it 'contains the map additional markers' do
        subject.should include(URI.escape(map.additional_markers))
      end
    end
  end
end
