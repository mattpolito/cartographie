require 'addressable/uri'
require 'cartographie/config'

module Cartographie
  # Map represents a map, and contains the details regarding a
  # map's dimensions, zoom level, the image file format, and whether a GPS
  # sensor was used in determining the map's location.
  class Map

    # Public: Gets/Sets the String location of the map.
    attr_accessor :location
    # Public: Gets/Sets the Hash options for the map.
    attr_accessor :options

    # Public: Initialize a Map
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
    #   Cartographie::Map.new('San Francisco, CA', zoom: 10)
    def initialize(location='Paris, France', options={})
      self.location = location
      self.options = options
    end

    # Public: Build a Google Static Maps image URI
    #
    # Returns the String URI pointing an image of the map
    def uri
      params = {
        center: location,
        size: size,
        zoom: zoom,
        format: file_format,
        sensor: sensor.to_s
      }
      Addressable::URI.parse(api_endpoint).tap do |uri|
        uri.query_values = params
      end.to_s
    end
    alias to_s uri

    def additional_points
      points.join('|')
    end

    # Returns the Integer width passed in options, or default
    def width
      options[:width] || Config.width
    end

    # Returns the Integer height passed in options, or default
    def height
      options[:height] || Config.height
    end

    # Returns the Integer zoom level passed in options, or default
    def zoom
      options[:zoom] || Config.zoom
    end

    # Returns the String file format passed in options, or default
    def file_format
      options[:file_format] || Config.file_format
    end

    # Returns the Boolean indicating sensor usage passed in options, or default
    def sensor
      options[:sensor] || Config.sensor
    end

    # Returns a string combining width and height into dimensions
    def size
      "#{width}x#{height}"
    end

    # Returns an Array with additional map points
    def points
      options[:points] || Config.points
    end

    private

    def api_endpoint
      options[:api_endpoint] || Config.api_endpoint
    end
  end
end
