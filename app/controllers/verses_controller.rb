class VersesController < ApplicationController
#Seems to be optional to require net/http
# require 'net/http'

def show
  @verse=Verse.find(params[:id])
  @category=@verse.categories.first
  passage=@verse.reference
  passage = passage.gsub(/\s/, "+")
  passage = passage.gsub(/\:/, "%3A")
  passage = passage.gsub(/\,/, "%2C")
  @options = ["include-short-copyright=1",
                "output-format=html",
                "include-passage-horizontal-lines=0",
                "include-heading-horizontal-lines=0",
                "include-verse-numbers=0","include-footnotes=0","include-headings=0","include-subheadings=0","audio-format=mp3"].join("&")
  crossway_url="http://www.esvapi.org/v2/rest/passageQuery?key=9f13669f8d7125e4&passage=#{passage}&#{@options}"
  # APPEND TO URL &include-headings=false&include-short-copyright=1
  @verse_html=Net::HTTP.get(::URI.parse(crossway_url))
end

def new
  @verse=Verse.new
end

def create
    @verse=Verse.new(params.require(:verse).permit(:reference,category_ids:[]))
    @category=Category.first
    if verse_valid?(params["verse"]["reference"]) && @verse.save
      flash[:alert] = "Your verse was successfully added."
      redirect_to categories_path
    else
      flash[:error] = "There was a problem with saving your verse.  Check to make sure your reference is accurate."
      redirect_to :back
    end
end

  def strong_params
    # UNCOMMENT THIS IF IT WORKS:
    # params.require(:post).permit(:url,:title,:description,:category_ids)
    params.require(:post).permit!
    #I think the reason this works is not because you
    #pass in a function into the update_attributes method
    #but because "require(:post).permit! enables you
    #to send things over"
  end

def verse_valid?(supplied_text)
  passage=supplied_text
  passage = passage.gsub(/\s/, "+")
  passage = passage.gsub(/\:/, "%3A")
  passage = passage.gsub(/\,/, "%2C")
  crossway_url="http://www.esvapi.org/v2/rest/passageQuery?key=9f13669f8d7125e4&passage=#{passage}&include-headings=false&include-short-copyright=1"
  Net::HTTP.get(::URI.parse(crossway_url))!="ERROR: No results were found for your search."
end


end
