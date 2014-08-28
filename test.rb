#this works

require 'net/http'
require 'pry'
url="http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=Genesis1:1&include-headings=false&include-short-copyright=1"
binding.pry

def get_text(url) 
Net::HTTP.get(::URI.parse(url))
end

puts get_text(url)