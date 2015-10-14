module RSpotify
  class << self
    def parse_uri(uri)
      if (uri_components = get_uri_components(uri))
        if uri_components['type'] == 'playlist'
          RSpotify::Playlist.find(uri_components['user'], uri_components['playlist'])
        else
          RSpotify.const_get(uri_components['type'].capitalize).find(uri_components[uri_components['type']])
        end
      else
        nil
      end
    end

    def uri_type(uri)
      if (uri_components = get_uri_components(uri))
        uri_components['type']
      else
        nil
      end
    end

    private
    def get_uri_components(uri)
      match = /spotify:(?:user:([A-Za-z0-9.]+):playlist:([A-Za-z0-9]+))|(?:(user|track|artist|album):([A-Za-z0-9.]+))/.match(uri)
      if match
        if match[1] && match[2]
          {'type' => 'playlist', 'user' => match[1], 'playlist' => match[2]}
        elsif match[3] && match[4]
          {'type' => match[3], "#{match[3]}" => match[4]}
        else
          nil
        end
      else
        nil
      end
    end
  end
end
