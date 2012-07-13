require 'spec_helper'
require 'cartographie'
require 'cartographie/config'

describe Cartographie::Config do
  subject { Cartographie::Config }

  describe "default configs" do
    its(:api_endpoint) { should eq('http://maps.googleapis.com/maps/api/staticmap') }
    its(:width) { should eq(300) }
    its(:height) { should eq(300) }
    its(:zoom) { should eq(15) }
    its(:file_format) { should eq('png') }
    its(:sensor) { should be_false }
  end

  describe "setting new defaults" do
    before do
      Cartographie.configure do |config|
        config.width = 100
        config.height = 100
        config.zoom = 10
        config.file_format = 'jpg'
        config.sensor = true
      end
    end

    its(:width) { should eq(100) }
    its(:height) { should eq(100) }
    its(:zoom) { should eq(10) }
    its(:file_format) { should eq('jpg') }
    its(:sensor) { should be_true }
  end
end
