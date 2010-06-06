require 'rubygems'
require 'flickraw'

API_KEY = 'a3ced0126afc4d7ddbd0e8ebc4de69d4'
SECRET = '2f39974c7de33f63'

# LEWISPENDERRY
# TOKEN = '72157624167102370-d764b407cec94c42' # penderrylewis
# ID = '30170921@N04'
# SET = '72157624036028179'

# MADNASHUA
TOKEN = '72157624049527501-e84ef80e9a07f376' # madnashua
ID = '75878081@N00'
SET = '72157624041303403'

FlickRaw.api_key = API_KEY
FlickRaw.shared_secret = SECRET

auth = flickr.auth.checkToken :auth_token => TOKEN

filename = File.join(File.dirname(__FILE__), '..', 'source', '_includes', 'artwork.html')

File.open(filename, 'w') do |f|
  f.puts '<div class="flickr_photos">'
  

  @photos = flickr.photosets.getPhotos(:photoset_id =>SET, :privacy_filter=>'5')
  @photos.photo.each do |photo|
    f.puts %Q{<div class="painting"><img src="#{FlickRaw.url_m(photo)}" alt="#{photo.title}" /></div>}
  end
  
  f.puts '<div class="clr"></div>'
  f.puts '</div>'
end

mtime = Time.new
File.utime(mtime, mtime, filename)