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
  crossway_url="http://www.esvapi.org/v2/rest/passageQuery?key=9f13669f8d7125e4&passage=#{passage}&include-headings=false&include-short-copyright=1"
  @verse_html=Net::HTTP.get(::URI.parse(crossway_url))
end

def new
  @verse=Verse.new
end

def create
  binding.pry
  @verse=Verse.new(params.require(:verse).permit(:reference,category_ids:[]))
  @category=Category.first
  if @verse.save
    redirect_to categories_path
  else
    flash[:error] = "Please re-enter the verse reference."
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

end
