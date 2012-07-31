require "cartographie/version"

# Cartographie is the root module for all of Cartographie's components
module Cartographie

  autoload :Config, 'cartographie/config'
  autoload :Map, 'cartographie/map'

  # Public: Create a new Map instance.
  #
  # options  - The Hash options used to configure the map (default: {}):
  #            :center      - The center point on the map (optional if markers
  #            provided)
  #            :width       - The Integer width of the map (optional).
  #            :height      - The Integer height of the map (optional).
  #            :zoom        - The Integer zoom level (optional).
  #            :file_format - The String file format for the image (optional).
  #            :sensor      - The Boolean indicating GPS usage (optional).
  #
  #
  # Examples
  #
  #   Cartographie.map(center: 'San Francisco, CA', zoom: 10)
  #
  # Returns an instance of Cartographie::Map
  def self.map(options={})
    Map.new(options)
  end

  def self.configure(&block)
    Cartographie::Config.configure(&block)
  end

end
