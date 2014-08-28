class VersesController < ApplicationController
#Seems to be optional to require net/http
# require 'net/http'

def show
  @verse=Verse.find(params[:id])
  passage=@verse.reference
  passage = passage.gsub(/\s/, "+")
  passage = passage.gsub(/\:/, "%3A")
  passage = passage.gsub(/\,/, "%2C")
  crossway_url="http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=#{passage}&include-headings=false&include-short-copyright=1"
  @verse_html=Net::HTTP.get(::URI.parse(crossway_url))
  
end

end
