require 'rspotify/connection'
require 'rspotify/version'
require 'rspotify/parse'

module RSpotify
  autoload :Album,    'rspotify/album'
  autoload :Artist,   'rspotify/artist'
  autoload :Base,     'rspotify/base'
  autoload :Category, 'rspotify/category'
  autoload :Playlist, 'rspotify/playlist'
  autoload :Track,    'rspotify/track'
  autoload :User,     'rspotify/user'
end
