require 'rubygems'
require 'flickraw'

API_KEY = 'a3ced0126afc4d7ddbd0e8ebc4de69d4'
SECRET = '2f39974c7de33f63'
TOKEN = '72157624167102370-d764b407cec94c42'
ID = '30170921@N04' #lewispenderry
SET = '72157624036028179'

FlickRaw.api_key = API_KEY
FlickRaw.shared_secret = SECRET

auth = flickr.auth.checkToken :auth_token => TOKEN

filename = File.join(File.dirname(__FILE__), '..', 'source', '_includes', 'artwork.html')

File.open(filename, 'w') do |f|
  f.puts '<div class="flickr_photos">'
  

  @photos = flickr.photosets.getPhotos(:photoset_id =>SET, :privacy_filter=>'5')
  @photos.photo.each do |photo|
    f.puts %Q{<img src="#{FlickRaw.url_m(photo)}" alt="#{photo.title}" />}
  end
  
  f.puts '</div>'
end