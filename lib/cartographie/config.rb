module Cartographie
  module Config
    extend self

    def configure
      yield self
    end

    def reset
      OPTIONS.replace DEFAULTS
    end

    def api_endpoint
      OPTIONS[:api_endpoint]
    end

    def width
      OPTIONS[:width]
    end

    def width=(value)
      OPTIONS[:width] = value
    end

    def height
      OPTIONS[:height]
    end

    def height=(value)
      OPTIONS[:height] = value
    end

    def zoom
      OPTIONS[:zoom]
    end

    def zoom=(value)
      OPTIONS[:zoom] = value
    end

    def file_format
      OPTIONS[:file_format]
    end

    def file_format=(value)
      OPTIONS[:file_format] = value
    end

    def sensor
      OPTIONS[:sensor]
    end

    def sensor=(value)
      OPTIONS[:sensor] = value
    end

    def points
      OPTIONS[:points]
    end

    def points=(value)
      OPTIONS[:points] = value
    end

    private

    DEFAULTS = {
      api_endpoint: 'http://maps.googleapis.com/maps/api/staticmap',
      width: 300,
      height: 300,
      zoom: 15,
      file_format: 'png',
      sensor: false,
      points: []
    }
    OPTIONS = {}.merge!(DEFAULTS)
  end
end
