require 'spec_helper'
require 'cartographie'

describe Cartographie do

  let(:center) { { center: 'Paris, France' } }
  subject { described_class.map center }

  describe '.map' do
    class Cartographie::Map
    end

    it { should be_a(Cartographie::Map) }
  end

end
