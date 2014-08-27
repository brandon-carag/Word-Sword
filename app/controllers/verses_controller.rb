class VersesController < ApplicationController

  def show
    @verse=Verse.find(params[:id])
    =
  end

end
