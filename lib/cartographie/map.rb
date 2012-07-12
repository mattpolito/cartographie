module Cartographie
  # Map represents a map, and contains the details regarding a
  # map's dimensions, zoom level, the image file format, and whether a GPS
  # sensor was used in determining the map's location.
  class Map

    # Public: Gets/Sets the String location of the map.
    attr_accessor :location
    # Public: Gets/Sets the Hash options for the map.
    attr_accessor :options

    DEFAULT_WIDTH       = 300
    DEFAULT_HEIGHT      = 300
    DEFAULT_ZOOM        = 15
    DEFAULT_FILE_FORMAT = 'png'
    DEFAULT_SENSOR      = false

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

    # Returns the Integer width passed in options, or default
    def width
      options[:width] || DEFAULT_WIDTH
    end

    # Returns the Integer height passed in options, or default
    def height
      options[:height] || DEFAULT_HEIGHT
    end

    # Returns the Integer zoom level passed in options, or default
    def zoom
      options[:zoom] || DEFAULT_ZOOM
    end

    # Returns the String file format passed in options, or default
    def file_format
      options[:file_format] || DEFAULT_FILE_FORMAT
    end

    # Returns the Boolean indicating sensor usage passed in options, or default
    def sensor
      options[:sensor] || DEFAULT_SENSOR
    end

    # Returns a string combining width and height into dimensions
    def size
      "#{width}x#{height}"
    end
  end
end
