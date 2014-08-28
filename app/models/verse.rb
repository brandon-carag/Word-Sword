class Verse < ActiveRecord::Base
has_many :verse_categories
has_many :categories, through: :verse_categories

# require 'net/http'

def index
binding.pry
end

def show
binding.pry
url="http://www.esvapi.org/v2/rest/passageQuery?key=IP&passage=Genesis1:1&include-headings=false&include-short-copyright=1"

def get_text(url) 
Net::HTTP.get(::URI.parse(url))
end

@text=get_text(url)


end




end