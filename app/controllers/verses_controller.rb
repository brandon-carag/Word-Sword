class VersesController < ApplicationController

def show
  require 'net/http'
  url="http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=Genesis1:1&include-headings=false&include-short-copyright=1"
  @text=Net::HTTP.get(::URI.parse(url))
  
end

end
