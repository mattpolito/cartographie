require 'spec_helper'
require 'cartographie/map'

describe Cartographie::Map do

  subject { described_class.new }

  describe 'defaults' do
    its(:location) { should eq('Paris, France') }
    its(:width) { should eq(300) }
    its(:height) { should eq(300) }
    its(:size) { should eq('300x300') }
    its(:zoom) { should eq(15) }
    its(:file_format) { should eq('png') }
    its(:sensor) { should be_false }
  end

  describe 'with options' do
    let(:options) do
      { width: 75, height: 75, zoom: 10, file_format: 'jpg', sensor: true }
    end
    subject { described_class.new 'New York, NY', options }

    its(:location) { should eq('New York, NY') }
    its(:width) { should eq(75) }
    its(:height) { should eq(75) }
    its(:size) { should eq('75x75') }
    its(:zoom) { should eq(10) }
    its(:file_format) { should eq('jpg') }
    its(:sensor) { should be_true }
  end

end
