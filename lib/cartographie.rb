require "cartographie/version"

# Cartographie is the root module for all of Cartographie's components
module Cartographie

  autoload :Map, 'cartographie/map'

  # Public: Create a new Map instance.
  #
  # location - The String for the map's location (default: 'Paris, France').
  # options  - The Hash options used to configure the map (default: {}):
  #            :width       - The Integer width of the map (optional).
  #            :height      - The Integer height of the map (optional).
  #            :zoom        - The Integer zoom level (optional).
  #            :file_format - The String file format for the image (optional).
  #            :sensor      - The Boolean indicating GPS usage (optional).
  #
  # Examples
  #
  #   Cartographie.map('Tokyo, Japan')
  #   Cartographie.map('San Francisco, CA', zoom: 10)
  #
  # Returns an instance of Cartographie::Map
  def self.map(location = 'Paris, France', options={})
    Map.new(location, options)
  end

end
