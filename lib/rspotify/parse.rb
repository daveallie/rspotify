module RSpotify
  class << self
    def parse_uri(uri)
      match = /spotify:(?:user:([A-Za-z0-9]+):playlist\:([A-Za-z0-9]+))|(?:(user|track|artist|album):([A-Za-z0-9]+))/.match(uri)
      if match
        if match[1] && match[2]
          RSpotify::Playlist.find(match[1], match[2])
        elsif match[3] && match[4]
          RSpotify.const_get(match[3].capitalize).find(match[4])
        else
          nil
        end
      else
        nil
      end
    end
  end
end
