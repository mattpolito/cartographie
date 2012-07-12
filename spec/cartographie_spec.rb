require 'spec_helper'
require 'cartographie'

describe Cartographie do

  subject { described_class.map }

  describe '.map' do
    class Cartographie::Map
    end

    it { should be_a(Cartographie::Map) }
  end

end
