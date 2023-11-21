class SpaceportsController < ApplicationController

  def index
    @spaceports = Spaceport.all
  end
end
