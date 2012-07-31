require 'spec_helper'
require 'cartographie'
require 'cartographie/config'

describe Cartographie::Config do
  after { Cartographie::Config.reset }

  describe "default configs" do
    its(:api_endpoint) { should eq('http://maps.googleapis.com/maps/api/staticmap') }
    its(:width) { should eq(300) }
    its(:height) { should eq(300) }
    its(:zoom) { should eq(15) }
    its(:file_format) { should eq('png') }
    its(:sensor) { should be_false }
    its(:points) { should eq([]) }
  end

  describe "setting new defaults" do
    before do
      Cartographie.configure do |config|
        config.width = 100
        config.height = 100
        config.zoom = 10
        config.file_format = 'jpg'
        config.sensor = true
        config.points = ["Eiffel Tower", "Louvre"]
      end
    end


    its(:width) { should eq(100) }
    its(:height) { should eq(100) }
    its(:zoom) { should eq(10) }
    its(:file_format) { should eq('jpg') }
    its(:sensor) { should be_true }
    its(:points) { should =~ (["Eiffel Tower", "Louvre"]) }
  end

  describe "resetting to defaults" do
    before do
      Cartographie.configure do |config|
        config.width = 50
        config.height = 50
        config.zoom = 5
        config.file_format = 'gif'
        config.sensor = true
      end
    end

    it "replaces all custom configuration" do
      expect(Cartographie::Config.width).to eq(50)
      expect(Cartographie::Config.height).to eq(50)
      expect(Cartographie::Config.zoom).to eq(5)
      expect(Cartographie::Config.file_format).to eq('gif')
      expect(Cartographie::Config.sensor).to eq(true)

      Cartographie::Config.reset

      expect(Cartographie::Config.width).to eq(300)
      expect(Cartographie::Config.height).to eq(300)
      expect(Cartographie::Config.zoom).to eq(15)
      expect(Cartographie::Config.file_format).to eq('png')
      expect(Cartographie::Config.sensor).to eq(false)
    end
  end
end
