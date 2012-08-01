require 'cartographie/config'
require 'cartographie/exceptions'
require 'uri'

module Cartographie
  # Map represents a map, and contains the details regarding a
  # map's dimensions, zoom level, the image file format, and whether a GPS
  # sensor was used in determining the map's location.
  class Map

    # Public: Gets/Sets the Hash options for the map.
    attr_accessor :options

    # Public: Initialize a Map
    #
    # options  - The Hash options used to configure the map (default: {}):
    #            :center      - The center point on the map (optional if
    #            markers supplied).
    #            :width       - The Integer width of the map (optional).
    #            :height      - The Integer height of the map (optional).
    #            :zoom        - The Integer zoom level (optional).
    #            :file_format - The String file format for the image (optional).
    #            :sensor      - The Boolean indicating GPS usage (optional).
    #            :points      - Additional points to be shown (optional).
    #
    # Examples
    #
    #   Cartographie::Map.new(center: 'San Francisco, CA', zoom: 10)
    def initialize(options={})
      self.options = options

      if self.center.empty? && self.points.empty?
        raise Cartographie::MissingCenterOrMapPoint, 'provide a center or map points'
      end
    end

    # Public: Build a Google Static Maps image URI
    #
    # Returns the String URI pointing an image of the map
    def uri
      URI.parse(api_endpoint).tap do |uri|
        uri.query = query_string
      end.to_s
    end
    alias to_s uri

    # Returns the uri query string
    def query_string
      params = {
        center: center,
        size: size,
        zoom: zoom,
        format: file_format,
        maptype: maptype,
        markers: additional_markers,
        sensor: sensor.to_s
      }

      URI.escape(params.map { |k,v| "#{k}=#{v}" unless v.to_s.empty? }.compact.join('&'))
    end

    # Returns a formatted string of additional locations
    def additional_markers
      points.join('|').gsub(/\s/, '+')
    end

    # Returns the Center point passed in options, or default
    def center
      options[:center] || Config.center
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

    def maptype
      valid_map_types.select { |type| type if type == options[:maptype] }.join
    end

    private

    # Does not include 'roadmap' because it is the google default
    def valid_map_types
      ["satellite", "terrain", "hybrid"]
    end

    def api_endpoint
      options[:api_endpoint] || Config.api_endpoint
    end
  end
end
